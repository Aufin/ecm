(import "../db.ss" "../req" "../user"
  :std/net/httpd :std/net/uri
  :std/format :std/db/dbi :std/interactive
  :std/actor-v18/message)

(export handler-init! handle-request)

(def (handler-init! cfg) #t)

(def (countries)
  (car (ecm-sql sql-eval-query
		  "SELECT json_agg(c) FROM (SELECT *
 FROM country ORDER BY name) c")))


(def handle-request
  (user-request-handler
   (lambda (req res)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def results (countries))
     (http-response-write res 200 '(("Content-Type" . "application/json"))
			 results))))
