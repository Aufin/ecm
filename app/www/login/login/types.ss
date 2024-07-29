(export #t (struct-out login))
(defstruct login (id user-id username effective expiry)
  transparent: #t)
