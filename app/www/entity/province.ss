(import
  :std/net/httpd :std/net/uri
  :std/format :std/db/dbi :std/interactive
  "../db.ss" "../req" "../user"
  :std/actor-v18/message)

(export handler-init! handle-request)

(def (handler-init! cfg) #t)

(def (provinces (country "CA"))
  (car (ecm-sql sql-eval-query
		  "SELECT json_agg(c) FROM (SELECT *
 FROM province WHERE country = ($1) ORDER BY name) c" country)))


(def handle-request
  (user-request-handler
   (lambda (req res)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def country (or (assget "country" params) "CA"))
     (def results (provinces country))
     (http-response-write res 200 '(("Content-Type" . "application/json"))
			 results))))
