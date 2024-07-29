(import ./conf :std/text/json :std/db/dbi :std/db/postgresql)
(export #t)

(def (database-connect)
   (let* ((db (conf-value '(database master)))
	  (host (conf-value 'host db))
          (port (conf-value 'port db))
          (dbname (conf-value 'database db))
          (u (conf-value 'username db))
          (p (conf-value 'password db)))
     (sql-connect postgresql-connect host: host port: port user: u passwd: p db: dbname)))


(def (authenticate username password)
  (def db (database-connect))
  (let (res (car (sql-eval-query db "SELECT login.login_user($1, $2)"
				 username password)))
    (sql-close db)
    (if (not res) res
	(call-with-input-string res read-json))))

;;; `create-reset-token` => (full-name username token) || #f
(def (create-reset-token email)
  (def db (database-connect))
  (let (res (sql-eval-query
	     db "SELECT person_short_name(person_id), username,
     login.\"create\"(app_user_id)
   FROM app_user RIGHT JOIN person USING (person_id)
   WHERE email_address = $1" email))
    (if (null? res) #f (vector->list (car res)))))

(def (reset-password tok pw)
  (def db (database-connect))
  (let (res (sql-eval-query db "SELECT login.change_password($1, $2)" tok pw))
    (if (null? res) #f (car res))))
