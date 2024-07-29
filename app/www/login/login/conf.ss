(import :std/text/json)
(export #t)

(def conf #f)

(def (update-conf (fname "~/.ecm/ecm.json"))
  (set! conf (call-with-input-file fname read-json)))

(def (conf-value key (conf conf) reload: (r? #f))
  (def rest [])
  (when (list? key) (set! rest (cdr key)) (set! key (car key))) 
  (when (or (not conf) r?) (update-conf))
  (let ((res (hash-ref conf key (void))))
    (if (and (not (null? rest)) (hash-table? res))
      (conf-value rest res)
      res)))
