(import
   :std/pregexp :std/net/smtp :std/net/httpd/mux :std/net/httpd :std/net/uri
   :std/contract :std/text/json :std/misc/ports :std/text/utf8
   :ecm/login/database :ecm/login/handler)
 (export #t)

 (def %reset-email-text "
   <html> <body> <h3> ECM Password Reset Request</h3>
   Hey NAME,<br>
   <br>
   Someone has requested a password reset for the user 'USER' on ECM.
   <br> <br>
   If it was not you please ignore this or report to an administrator.
   <br> <br>
   Otherwise, <a href=\"TOKEN\"> Click Here </a> to reset your password.
   <br> <br>
   Cheers,
   <br> <br>
   ECM System
   </body> </html>")

 (def (reset-email-text name user url)
   (pregexp-replace
    "NAME" (pregexp-replace
 	   "USER"
 	   (pregexp-replace "TOKEN" %reset-email-text url)
 	   user)
    name))

 (def (send-reset-email
       email-address (host "ecm.maxwellclaims.net")
       (proto "https")
       (smtp-host "maxbakuntu.lan:25"))
   (def tok (create-reset-token email-address))
   (match tok 
     (#f tok)
     ([name username token]
      (let ((data [To: (string-append name " <"email-address">")
 	              From: "ECM System"
 	              Subject: "ECM Password Reset"
 		      Content-Type: "text/html"
 		      (reset-email-text
 		       name username
 		       (string-append proto "://" host "/ecm/login/reset?tok=" token))])
 	   (smtp (smtp-connect smtp-host)))
        (apply send-mail smtp "postfix@drewc.ca" email-address data)))))

 (def (reset-json-handler req res)
   (def ps (http-request-params req))
   (def args (form-url-decode ps))
   (def email (assget "email" args))
   (def tok (send-reset-email email))
   (display email)
   (http-response-write
    res 200 '(("Content-Type" . "application/json"))
    (with-output-to-string "" (cut write-json tok))))

 (def (reset-html token)
   (def str (read-file-string (static-path-expand "reset-password.html")))
   (pregexp-replace "TOKEN" str token))

 (def (reset/POST req res)
   (def bdy (http-request-body req))
   (def tbl (call-with-input-u8vector bdy read-json))
   (def tok (hash-ref tbl 'token))
   (def pw (hash-ref tbl 'pw))
   (def re (reset-password tok pw))
   (http-response-write
    res 200 '(("Content-Type" . "application/json"))
    (with-output-to-string "" (cut write-json re))))
    
   
 (def (reset-handler req res)
   (if (eq? 'POST (http-request-method req))
     (reset/POST req res)
     (let ()
       (def ps (http-request-params req))
       (def args (form-url-decode ps))
       (def tok (assget "tok" args))
       (def str (reset-html tok))
       (http-response-write
        res 200 '(("Content-Type" . "text/html")) str))))

 ;; http://localhost:8080/ecm/login/logo.jpg
 (def (logo-handler _ res)
   (http-response-file res '(("Content-Type" . "image/jpeg"))
 		      (static-path-expand "logo.jpg")))

 ;; http://localhost:8080/ecm/login/gerbil-logo.svg  
 (def (gerbil-logo-handler _ res)
   (http-response-file res '(("Content-Type" . "image/svg+xml"))
 		      (static-path-expand "gerbil-logo.svg")))


 (using (self login-mux :- static-http-mux)
  (hash-put! self.t "/ecm/login/reset.json" (cut reset-json-handler <> <>))
  (hash-put! self.t "/ecm/login/reset" (cut reset-handler <> <>))
  (hash-put! self.t "/ecm/login/logo.jpg" (cut logo-handler <> <>))
  (hash-put! self.t "/ecm/login/gerbil-logo.svg" (cut gerbil-logo-handler <> <>)))
