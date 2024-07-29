(import :std/net/httpd :std/net/uri
        :std/format :std/db/dbi :std/text/utf8
	:std/text/json
	"../db" "../req" "../user")

(export handler-init! handle-request)

(defstruct login (id user-id username effective expiry)
  transparent: #t)

(def (authenticate username password)
  (let (res (car (ecm-sql
		  sql-eval-query
		  "SELECT login.login_user($1, $2)"
		  username password)))
    (if (not res) res
	(call-with-input-string res read-json))))

(def (login-user username password)
  (def tbl (authenticate username password))
  (if (not tbl) #f
      (make-login
       (hash-ref tbl "id")
       (hash-ref tbl "user_id") username
       (hash-ref tbl "time") (hash-ref tbl "until"))))

;;; `create-reset-token` => (full-name username token) || #f
#;(def (create-reset-token email)
  (def db (database-connect))
  (let (res (sql-eval-query
	     db "SELECT person_short_name(person_id), username,
     login.\"create\"(app_user_id)
   FROM app_user RIGHT JOIN person USING (person_id)
   WHERE email_address = $1" email))
    (if (null? res) #f (vector->list (car res)))))

#;(def (reset-password tok pw)
  (def db (database-connect))
  (let (res (sql-eval-query db "SELECT login.change_password($1, $2)" tok pw))
    (if (null? res) #f (car res))))

(def state "not initialized")

(def (handler-init! cfg) (set! state 'initialized))

(def (login/POST req res)
  (let* ((params (form-url-decode
		  (utf8->string (http-request-body req))))
	 (u (assget "u" params))
	 (pw (assget "p" params))
	 (keep (assget "keep" params))
	 (login (login-user u pw))
	 (getps (let ((ps (http-request-params req)))
		  (if ps (form-url-decode ps) [])))
	 (q (or (assget "q" params)
		(assget "q" getps)
		"/ecm/index")))
    (if login 
      (http-response-write
	res 200 `(("Content-Type" . "text/html")
		  ("Set-Cookie" .
		   ,(string-append
		     "ecm-login="
		     (login-id login) "; Path=/")))
	 (string-append "<!DOCTYPE html>
 <html><head>
 <meta http-equiv=\"refresh\" content=\"0; url='"q"'\">
 </head><body></body> </html>"))
      
      (http-response-write res 302 `(("Location" . ,(string-append "/ecm/drewc/login?_f&q=" q))) #f))))

(def handle-request
 ; (user-request-handler
   (lambda (req res)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def heads (http-request-headers req))
     (def post? (eq? (http-request-method req) 'POST))

     #;(def posters (and post?
		   (form-url-decode (utf8->string (http-request-body req)))))
     
     (def tok (assget "ecm-login"
		   (http-request-cookies req)))
     (if post? (login/POST req res)
     (http-response-write
      res 200 '(("Content-Type" . "text/plain"))
      (format "User Token? ~a ~a ~% headers ~a"
	      tok params 'posters)
      )
				  
                       #;(format "hello! I am a servlet and my state is ~a ~n ~a ~a ~a" ' (user-summary tok) (http-request-cookies req) std/net/httpd/handler#max-token-length))))

