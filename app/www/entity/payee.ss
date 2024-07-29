(import
  :std/net/httpd :std/net/uri
  :std/format :std/db/dbi :std/interactive
  "../db.ss" "../req" "../user"
  :std/actor-v18/message)

(export handler-init! handle-request)

(def (handler-init! cfg) 'make #t)

(def (payee id (limit 10) (offset 0))
  (def p (ecm-sql sql-eval-query
  		  "SELECT to_json(payme) FROM (
  SELECT person_name($1) AS payee, $1 as id,
         n AS count, $2 AS \"limit\", $3 as \"offset\", 
         json_agg(tranny) as claims 
  FROM
 (SELECT claim_id, (claim).status, ((claim).date_of_loss::date),
         jsi.policy_summary((policy)) as policy,
         jsi.contract_summary((contract)) as contract,
         jsi.corpus_summary((claim).adjuster_id) AS examiner,
         transactions  ,COUNT(*) OVER() AS n
    FROM (SELECT payee_id, claim_id, transaction as transactions
          
           FROM
  	 (SELECT
  	  claim_id, payee_id, max(transaction_date) AS date,
  	  json_agg(json_build_object('date', transaction_date::date, 'amount', amount, 'type', type)) as transaction
  	 FROM claim_transaction GROUP BY claim_id, payee_id ORDER BY date DESC)
        ct) tr RIGHT JOIN claim_view USING (claim_id)
               WHERE payee_id = $1
               LIMIT ($2) OFFSET ($3)) tranny
        GROUP BY n 



 ) payme" id limit offset))
  (and (pair? p) (car p)))



(def handle-request
  (user-request-handler
   (lambda (req res)
     ;;(http-response-timeout-set! res 1200)
     ;;(set-default-reply-timeout! 1200)
     (def params (form-url-decode (or (http-request-params req) "")))
     (def id (assget "id" params))
     (def results (and id (payee id)))
     (http-response-write res 200 '(("Content-Type" . "application/json"))
			(or results "{}")))))
