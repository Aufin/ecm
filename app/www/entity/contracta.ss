(import :std/net/httpd
        :std/format :std/db/dbi :std/interactive
;	"../db.ss" "../req" "../user"
	)

(export handler-init! handle-request)

(def (handler-init! cfg) #t)

#;(def (foo)
  (car (ecm-sql sql-eval-query
		  "SELECT json_agg(c)
  FROM (SELECT jso.contract(contract) AS c
        FROM contract ORDER BY contract_id DESC) jc")))
(def handle-request
  ;(user-request-handler
   (lambda (req res)
  (http-response-write res 200 '(("Content-Type" . "text/plain"))
                       (format "hello! I am a servlet and my state is ~a ~n ~a ~a" 1 2 3))))
;)

#;(def handle-request
  (user-request-handler
   (lambda (req res)
					;(error "HERE" (request-cookies req))
     (http-response-write res 200 '(("Content-Type" . "application/json"))
			    (foo)))))
