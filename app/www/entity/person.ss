(import :std/net/httpd :std/net/uri
        :std/format :std/db/dbi :std/interactive
	"../db.ss" "../req" "../user"
	:std/actor-v18/message
	:std/text/utf8 :std/sugar :std/text/json
	)

(export handler-init! handle-request)

(def (handler-init! cfg) #t)

(def (person-search q (limit 100))
  (car (ecm-sql sql-eval-query
		  "SELECT json_agg(c)
  FROM (SELECT to_json(person_search.*) AS c
        FROM person_search($1) LIMIT $2) jc" q limit)))

(def (upsert-person json)
  (ecm-sql sql-eval-query
  "SELECT to_json(upsert(null::person, $1::json))"
  json))

(def handle-request
  (user-request-handler
   (lambda (req res)
     ;;(http-response-timeout-set! res 1200)
     ;;(set-default-reply-timeout! 1200)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def upsert (not (eq? 'no (assget "upsert" params 'no))))
     (def query (assget "q" params))
     (def results (and query (person-search query 15)))
     (cond
      (upsert
       (let* ((bdy (utf8->string (http-request-body req)))
	      (upserted (try (upsert-person bdy)
			     (catch (e) (json-object->string
					 (hash (error (error-message e))))))))
       (http-response-write
	res 200 '(("Content-Type" . "application/json"))
	(format "~a" upserted))))
			    
      (else 
       (http-response-write res 200 '(("Content-Type" . "application/json"))
			    (format "{\"query\": \"~a\", \"results\": ~a}"
				    (or query params) (or results "[]"))))))))
