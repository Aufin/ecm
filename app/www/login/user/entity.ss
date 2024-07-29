(import ./database :std/text/json :std/db/dbi)
(export #t)

(defstruct user (id name admin write-access active role person-id person-name data)
  transparent: #t)

(def (get-user id db: (db #f))
  (def c (or db (current-user-database)))
  (def str (car (sql-eval-query
		 c "SELECT user_to_json($1::int)" id)))
  (def jso (string->json-object str))
  (def (& key) (hash-get jso key))
  (let* ((id (& 'user_id))
	 (name (& 'username))
	 (admin  (& 'admin))
	 (write-access (& 'can_edit))
	 (active (& 'active))
	 (role (& 'role))
	 (person (& 'person))

	 (person-id (and person (hash-get person 'person_id)))
	 (person-name (and person (hash-get person 'short_name)))
	 (data (& 'data)))
    (hash-put! data 'person person)

    (make-user id name admin write-access active role person-id person-name
	       data)))
