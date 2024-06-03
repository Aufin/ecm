((nil . ((eval . (setq-local
                  org-roam-directory (expand-file-name
				      "./roam/"
				      (locate-dominating-file
                                       default-directory ".dir-locals.el"))))
	 (eval . (setq-local
                  org-roam-db-location (expand-file-name
					"org-roam.db"
					org-roam-directory)))

	 ;; https://www.orgroam.com/manual.html#org_002droam_002ddailies

	 ;; For org-roam-dailies to work, you need to define two variables:
	 
	 ;; Variable: org-roam-dailies-directory
	 
	 ;;     Path to daily-notes. This path is relative to org-roam-directory. 
	 
	 ;; Variable: org-roam-dailies-capture-templates
	 
	 ;;     Capture templates for daily-notes in Org-roam. 

	 ;; Here is a sane default configuration:

	 ;; (setq org-roam-dailies-directory "daily/")

	 ;; (setq org-roam-dailies-capture-templates
	 ;;       '(("d" "default" entry
	 ;;          "* %?"
	 ;;          :target (file+head "%<%Y-%m-%d>.org"
	 ;;                             "#+title: %<%Y-%m-%d>\n"))))
	 (eval . (setq-local
                  org-roam-dailies-capture-templates
		        '(("d" "default" entry
	          "* %?"
	          :target (file+head "%<%Y-%m-%d>.org"
	                             "#+title: %<%Y-%m-%d>\n")))))
	  (eval . (setq-local
                  org-roam-dailies-directory (expand-file-name
					      "daily/"
					      org-roam-directory)))



	 )))
