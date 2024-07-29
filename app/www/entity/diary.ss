(import
  :std/net/httpd :std/net/uri :std/sugar
  :std/format :std/db/dbi :std/interactive
  "../db.ss" "../req" "../user"
  :std/actor-v18/message :std/text/utf8)

(export handler-init! handle-request)

(def (handler-init! cfg)
  #t)

(def (diary json)
  (car
   (ecm-sql
    sql-eval-query "SELECT diary_view_datatable(($1::text)::json)"
    json)))

(def (upsert-diary json)
  (car
   (ecm-sql
    sql-eval-query "SELECT to_json(upsert(null::diary_view, (($1::text)::json)))"
    json)))
		

(def handle-request
  (user-request-handler
   (lambda (req res)
      (def params (form-url-decode (or (http-request-params req) "")))
      (def upsert (assget "upsert" params 'nope))
      (def body (http-request-body req))
      (def json (and body (utf8->string body)))

      ;; (error "Upsert" upsert json)

      (def results
	  (cond
	   ((not (eq? upsert 'nope))
          (upsert-diary json))
	   (else (diary (or json "{}")))))

   (http-response-write
    res 200 '(("Content-Type" . "application/json"))
    results #;(format "{\"data\":\"~a\"}" (list params upsert))))))
