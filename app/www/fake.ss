(import :std/net/httpd
        :std/format  :std/db/dbi :std/interactive
	:std/actor
	"db" "req" "user")

(export handler-init! handle-request)


#;(begin
  (import :std/actor)
  (set-default-reply-timeout! 600))

(reload "/srv/ecm/app/www/db.ss")
(reload "/srv/ecm/app/www/req.ss")
(reload "/srv/ecm/app/www/user.ss")
(reload "/srv/ecm/app/www/conf.ss")

(module no-confile
  (reload "/srv/ecm/app/www/entity/contract.ss"))

(module no-confile-herre
  (reload "/srv/ecm/app/www/entity/province.ss"))

(module no-confile-heraare
  (reload "/srv/ecm/app/www/entity/country.ss"))
(module ano-confile-herre
  (reload "/srv/ecm/app/www/entity/diary.ss"))
(module bno-confile-herre
  (reload "/srv/ecm/app/www/entity/person.ss"))
;; (reload "/srv/ecm/app/www/entity/diary.ss")

(def state "not initialized")

(def (handler-init! cfg)
  (set! state 'initialized))

(def (db-test)
  (car
   (ecm-sql
    sql-eval-query
    "SELECT max(open_date) FROM claim;")))

(def handle-request
  (user-request-handler
   (lambda (req res)

    ; (set! std/net/httpd/handler#max-token-length 11024)
     (def tok (assget "ecm-login"
		      (http-request-cookies req)))

     ;; timeout comes from where?

     ;; (thread-sleep! 60) 

     (http-response-write
      res 200 '(("Content-Type" . "text/plain"))
      (format "Pool? ~a \n Conf db  ~a ~a ~a ~a \n\n~a"
	      (http-request->db-conpool req)
	      (conf-value ["database" "master" "host"] #f)
	      #;gerbil/tools/gxhttpd#main
	      (identity ;parameterize ((current-db-conpool-timeout 10))
	       (list
		(ecm-conpool-timeout? (current-db-conpool))
	       (db-test)
	       std/net/httpd/handler#max-token-length))
	      #; tok
	      (list (default-reply-timeout)
		    std/actor-v18/message#+default-reply-timeout+)
	      (list (http-request-cookies req)
		    '(user-summary tok))
	      (current-time)
	      )
				  
      #;(format "hello! I am a servlet and my state is ~a ~n ~a ~a ~a" ' (user-summary tok) (http-request-cookies req) std/net/httpd/handler#max-token-length)))))

