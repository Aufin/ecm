(import
  :std/net/httpd :std/net/uri
  :std/format :std/db/dbi :std/interactive
  "../db.ss" "../req" "../user"
  :std/actor-v18/message)

(export handler-init! handle-request)

(def (handler-init! cfg) #t)

(def (insured id)
  (car (ecm-sql sql-eval-query
		  "SELECT to_json(insured) FROM (SELECT
 person_name($1) AS name, $1 as id, json_agg(c) as claims
  FROM (SELECT jsi.claim_crux(claim_id) AS c
        FROM claim_view WHERE (policy).insured_id = $1) crux
  ) insured" id)))

(def handle-request
  (user-request-handler
   (lambda (req res)
     ;;(http-response-timeout-set! res 1200)
     ;;(set-default-reply-timeout! 1200)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def id (assget "id" params))
     (def results (and id (insured id)))
     (http-response-write res 200 '(("Content-Type" . "application/json"))
			 results))))
