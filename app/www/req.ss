(import :std/net/httpd :std/srfi/13)
(export #t (import: :std/net/httpd))

(def http-request-cookies-cache
  (make-hash-table-eq
   weak-keys: #t))

(def (http-request-cookies req)
  (or (hash-get http-request-cookies-cache req)
      (let* ((hs (http-request-headers req))
             (cj (assget "Cookie" hs))
             (cookies
              (and cj (map (lambda (c) (match (map string-trim (string-split c #\=))
                                    ([a b] [a . b])))
			   (string-split cj #\;))))
	     (cookies (or cookies [])))
	(hash-put! http-request-cookies-cache req
		   cookies)
	cookies)))

 
