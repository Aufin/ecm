(import :std/net/httpd :std/misc/ports
	:std/db/postgresql :std/db/dbi
	:std/net/uri :std/text/utf8

	#;:drewc/ftw/httpd/cookies)

(import ./api)
(export #t)

(def current-static-path (make-parameter "/opt/ecm/user/static/"))
(def static-path-expand (cut path-expand <> (current-static-path)))


;(def dbg #f)

(def (login/POST req res)
  (let* ((params (form-url-decode (utf8->string (http-request-body req))))
	 (u (assget "u" params))
	 (pw (assget "p" params))
	 (keep (assget "keep" params))
	 (login (login-user u pw))
	 (getps (let ((ps (http-request-params req)))
		  (if ps (form-url-decode ps) [])))
	 (q (or (assget "q" getps) "/ecm/index")))
    (if login 
      (http-response-write
	res 200 `(("Content-Type" . "text/html")
		  ("Set-Cookie" . ,(string-append "ecm-login=" (login-id login))))
	 (string-append "<!DOCTYPE html>
 <html><head><meta http-equiv=\"refresh\" content=\"0; url='"q"'\">
 </head><body></body> </html>"))
      
      (http-response-write res 302 `(("Location" . ,(string-append "/ecm/login?_f&q=" q))) #f))))

(def (login-handler req res)
  ;;(set! dbg req)
  (if (equal? 'POST (http-request-method req))
    (login/POST req res)
  (http-response-file
   res '(("Content-Type" . "text/html"))
   (static-path-expand "login-dark.html"))))

(def (login.js req res)
  (http-response-file
   res '(("Content-Type" . "text/javascript"))
   (static-path-expand "login.js")))


(def login-mux
  (make-static-http-mux
   (list->hash-table
    `(("/ecm/login" .,(cut login-handler <> <>))
      ("/ecm/login/login.js" .,(cut login.js <> <>))))
   (cut login-handler <> <>)))

(def (run-login-server (address "10.42.1.100:8080"))
  (start-http-server! address mux: login-mux))


(def login-server #f)
