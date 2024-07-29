(import :std/text/json)
(export #t)

(def conf #f)

(def (update-conf (fname "~/.ecm/ecm.json"))
  (when (file-exists? fname)
    (set! conf (call-with-input-file fname read-json))
    conf))

(def (conf-value
      key (not-found #f)
      conf: (conf conf) reload: (r? #f))
  
  (when (or (not conf) r?)
    (set! conf (update-conf)))
  
  (let cval ((keys (if (pair? key) key [key]))
	     (ht conf))
    (with ([key . rest] keys)
      (and ht
	 (let ((res (hash-ref ht key not-found)))
	   (if (and (not (null? rest)) (hash-table? res))
	     (cval rest res)
	     res))))))
