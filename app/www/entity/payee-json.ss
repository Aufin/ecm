(import
   :std/net/httpd :std/net/uri :std/sugar
   :std/format :std/db/dbi :std/interactive
   "../db.ss" "../req" "../user"
   :std/actor-v18/message)

 (export handler-init! handle-request)

 (def (handler-init! cfg)
   (set-httpd-max-token-length! (* 100 1024))
   (set! std/net/httpd/handler#max-token-length (* 100 1024))
   #t)

(begin
   (set-httpd-max-token-length! (* 100 1024))
   (set! std/net/httpd/handler#max-token-length (* 100 1024)))


 (def (payee id (limit 10) (offset 0) (draw 0))
   (car (ecm-sql sql-eval-query
 		  "SELECT to_json(payme) FROM (
 SELECT $4::int as draw, 
        -- n AS count, $2 AS \"limit\", $3 as \"offset\", 
        n AS \"recordsTotal\",      
        n AS \"recordsFiltered\",      
        json_agg(t) as data 
 FROM
(SELECT json_build_array(
          transactions, claim_id, (claim).status, ((claim).date_of_loss::date),
          jsi.policy_summary((policy)),
          jsi.contract_summary((contract)),
          jsi.corpus_summary((claim).adjuster_id)) AS t,
        COUNT(*) OVER() AS n
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



) payme" id limit offset draw)))

 (def handle-request
   (user-request-handler
    (lambda (req res)
      ;;(http-response-timeout-set! res 1200)
      ;;(set-default-reply-timeout! 1200)
      (try 
       (def params (form-url-decode (or (http-request-params req) "")))
       (def id (assget "id" params))
       (def draw (assget "draw" params))
       (def limit (assget "length" params))
       (def offset (assget "start" params))
       (def results (and id (payee id limit (or offset 0) draw)))
       (http-response-write res 200 '(("Content-Type" . "application/json"))
 			    results)
       (catch (e)
        (displayln e)
	(http-response-write
	 res 500 '(("Content-Type" . "text/plain"))
	 (with-output-to-string "ERROR: " (cut display-exception e)))
	(error e))))))
