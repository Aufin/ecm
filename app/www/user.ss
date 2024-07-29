(import "db" "req"
	:std/db/dbi :std/sugar :std/format
	:std/error)
(export #t)

;; (std/interactive#reload "/srv/ecm/app/www/db.ss")

;;; The "User" record
;; Different users have different permissions.


;;; * Token : A login sets a token
;;  .. that token is a user in the database

(def token-role-table (make-hash-table))

(def (token->db-role tok (reload #f))
  (def role (hash-get token-role-table tok))
  (cond
   (role => identity)
   ((not reload)
    (token->db-role tok #t))
   (else
    (let ((role (car (ecm-sql sql-eval-query
		     "SELECT login.token_role($1::uuid)"
		     tok))))
      (if (not role) #f
	  (begin
	    (hash-put! token-role-table tok role)
	    role))))))
	
  
(def (http-request->db-role req)
  (def tok (assget "ecm-login"
		   (http-request-cookies req)))
  (token->db-role tok))

(def token-db-conpool-table (make-hash-table))

(def (token->db-conpool tok (max 10) reload: (reload #f))
  (def pool
    (and (not reload)
	 (hash-get token-db-conpool-table tok)))
  (or pool
      (let (role (token->db-role tok))
	(if (not role) #f
	    (let (pool (make-pgpool user: role max))
	      (hash-put! token-db-conpool-table tok pool)
	      pool)))))

(def (http-request->db-conpool req reload: (reload #f))
  (def tok (assget "ecm-login"
		   (http-request-cookies req)))
  (token->db-conpool tok reload: reload))

  
(def (user-request-handler handler)
  (lambda (req res)
    (try
     (def (make-db-pool (r #t))
       (http-request->db-conpool req reload: r))
     (def db-pool (make-db-pool #f))
		  
     (if (not db-pool)
       (http-response-write
	res 301
	'(("Location" . "/ecm/login")
	  ("Cache-Control" . "no-cache"))
	"")
     (parameterize ((current-db-conpool db-pool)
		    (current-db-conpool-constructor make-db-pool))
       (handler req res)))

     
     (catch (e)
       (displayln e)
       (http-response-write
	res 500 '(("Content-Type" . "text/plain"))
	
	(format "ERROR HERE?: ~a"
		(if (RuntimeException? e) 42 e)))
	(raise e)))))
   		   

  
				    