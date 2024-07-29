(import :std/net/httpd
        :std/format  :std/db/dbi :std/interactive
	"db" "req" "user")

(export handler-init! handle-request)

(reload "/srv/ecm/app/www/db.ss")
(reload "/srv/ecm/app/www/req.ss")
(reload "/srv/ecm/app/www/user.ss")
(reload "/srv/ecm/app/www/entity/contract.ss")
;; (reload "/srv/ecm/app/www/entity/diary.ss")


(def state "not initialized")

(def (handler-init! cfg)
  (set! state 'initialized))

(def (foo)
  (car (ecm-sql sql-eval-query
		"SELECT json_agg(c)
    FROM (SELECT jso.contract(contract) AS c
          FROM contract ORDER BY contract_id DESC) jc")))

(def (%user-summary)

  (car (ecm-sql sql-eval-query
		"
  SELECT jsi.user_summary(app_user)::jsonb || json_build_object('role', jsi.app_user_role(app_user))::jsonb
  FROM app_user LIMIT 1;")))
(def (%%user-summary tok)

  (car (ecm-sql sql-eval-query
		"SELECT login.token_role($1::uuid)"
		tok)))
(def (user-summary tok)

  (car (ecm-sql sql-eval-query
		"SELECT 42, CURRENT_USER;"
		tok)))
(def (%handle-request req res)
  ;(error "HERE" (request-cookies req))
  (http-response-write res 200 '(("Content-Type" . "application/json"))
                       (foo)))
;; (set! std/net/httpd/handler#max-token-length 11024)
(def handle-request
  (user-request-handler
   (lambda (req res)

    ; (set! std/net/httpd/handler#max-token-length 11024)
     (def tok (assget "ecm-login"
		      (http-request-cookies req)))

     ;; timeout comes from where?

     ;; (thread-sleep! ) 

     (http-response-write
      res 200 '(("Content-Type" . "text/plain"))
      (format "User Token? Rloa here iad ~a ~a ~a ~a "
	      (eq? 'GET (http-request-method req))
	      #;gerbil/tools/gxhttpd#main
	      std/net/httpd/handler#max-token-length
	      'tok (http-request-cookies req))
				  
                       #;(format "hello! I am a servlet and my state is ~a ~n ~a ~a ~a" ' (user-summary tok) (http-request-cookies req) std/net/httpd/handler#max-token-length)))))

