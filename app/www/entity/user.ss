(import
   :std/net/httpd :std/net/uri :std/sugar
   :std/format :std/db/dbi :std/interactive
   "../db" "../req" "../user.ss"
   :std/actor-v18/message :std/text/utf8)

 (export handler-init! handle-request)

 (def (handler-init! cfg)
   #t)

 (def (token->user-object token)
   (car
    (ecm-sql
     sql-eval-query "SELECT COALESCE(user_to_json(login.token_user_id($1)), 'false'::json)"
     token)))

 (def (select-user-list (for "diary"))
  (car
    (ecm-sql
     sql-eval-query "SELECT json_agg(json_array)
 FROM (SELECT json_array(app_user_id, short_name, (SELECT count(*) FROM diary_entry d WHERE d.app_user_id = app_user.app_user_id and not processed))
FROM app_user LEFT JOIN person USING (person_id) WHERE EXISTS (SELECT true FROM diary_entry d WHERE d.app_user_id = app_user.app_user_id LIMIT 1) ORDER BY short_name) du;"
     )))


 (def handle-request
   (user-request-handler
    (lambda (req res)
       (def params (form-url-decode (or (http-request-params req) "")))
       (def user-id (assget "user_id" params))
       (def list (assget "list" params 'nope))
       (def token (assget "token" params))
       ;(def body (http-request-body req))
       ;(def json (and body (utf8->string body)))

       ;; (error "Upsert" upsert json)

       (def results
 	(cond (token (token->user-object token))
 	      ((not (eq? list 'nope)) (select-user-list))
 	      (else "{\"user_here\": 42 }")))

       (http-response-write
        res 200 '(("Content-Type" . "application/json"))
        results ))))
