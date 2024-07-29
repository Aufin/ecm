;; [[file:../../Database.org::*Per User Pools][Per User Pools:1]]
(import :std/text/json :std/db/dbi :std/db/postgresql :std/db/conpool :std/sugar
	./interface ../../login/conf)
(export #t (import: ../../login/conf))
;; Per User Pools:1 ends here

(def (database-connect-using-token tok)
  (let* ((db (conf-value '(database master)))
 	 (host (conf-value 'host db))
         (port (conf-value 'port db))
         (dbname (conf-value 'database db))
         (u (conf-value 'username db))
         (p (conf-value 'password db))
	 (conn (sql-connect postgresql-connect
			    ssl: #f
			    host: host port: port
			    user: u passwd: p db: dbname)))
    (try (begin0 conn
	     (sql-eval conn "\
 SELECT login.set_role(role), login.set_session_authorization(role)
 FROM (SELECT * FROM login.token_role($1) role) token;" tok))
	 (catch (e)
	   (sql-close conn)
	   (error "Invalid Token" tok e)))))

(def token-database-pools (make-hash-table))

(def (make-token-conpool tok (max-connections 10))
  (def (token-conn) (database-connect-using-token tok))
  (make-conpool token-conn max-connections))

(def (get-token-conpool tok) (hash-ref token-database-pools tok #f))

(def (close-token-conpool tok)
  (def p (get-token-conpool tok)) (when p (conpool-close p)))

(def (remove-token-conpool tok (close #t))
  (when close (close-token-conpool tok)) (hash-remove! token-database-pools tok))

(def (get-token-connection tok (timeo 10) max: (max-connections 10))
  (def pool (let (p (hash-ref token-database-pools tok #f))
	      (or p (let (pp (make-token-conpool tok max-connections))
		      (begin0 pp
			(hash-put! token-database-pools tok pp))))))
  (conpool-get pool timeo))

(def (call-with-token-connection tok-or-args fn)
  (def args (if (string? tok-or-args) [tok-or-args] tok-or-args))
  (def conn (apply get-token-connection args))
  (def err #f)
  (try
   (parameterize ((current-user-database conn))
     (fn conn))
   (catch (e) (set! err e))
   (finally
    (let (p (get-token-conpool (car args)))
      (cond
       ((and err conn)
	(and p (conpool-release p conn))
	(raise err))
       (err (raise err))
       (conn (conpool-put p conn)))))))
