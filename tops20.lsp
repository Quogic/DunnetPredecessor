

(load "isis:comred")
(load "isis:macros")
(defspec command nil "Command" 
"Unrecognized command - does not match switch or keyword")
(defspec info nil "Info keyword" "Does not match switch or keyword ")
(defspec tnet nil "Command" 
"Unrecognized command - does not match switch or keyword")
(defspec connect nil "Network name" "Network not found")
(defspec chaos nil "Chaosnet host" "No chaosnet host matches that input")
(defspec arpa  nil "Arpanet host" "Not an arpanet host")

(comspec-add-items 'info '(directory arpanet chaosnet) t)
(comspec-add-items 'command '(tn telnet return information) t)
(comspec-add-items 'tnet '(connect exit) t)
(comspec-add-items 'connect '(arpanet chaosnet) t)
(comspec-add-items 'chaos '(dungeon dragon) t)
(comspec-add-items 'arpa '(endgame mit-sally) t)

(defun tops20 (imp)
  
  (setq comm nil)
  (terpri) (princ "Tops-20 Command Processor 0(a1)")
  (terpri) (princ "[Command RETURN defined]")
    (do ((foo ()))
      ((eq comm 'return))
      
      (let-comred "@"
			     (return (prog1 
				      (setq comm (comred 'command)
			       )
	
    (cond (
	   (eq comm 'information)
	   (comred-force-guideword "About")
	   (setq sinfo (comred 'info))
	   (comred 'confirm)
	   (cond (
		  (eq sinfo 'directory)
		  (princ 
"Name Ps:<Luser>
Working disk storage page limit - 0
Perminant disk storage page limit - 0
Chaos-net-user
Absolute-arpanet-sockets
Account default set for LOGIN players
Last login - Never logged in
"))
		 (
		  (eq sinfo 'arpanet)
		  (princ "%No arpanet"))
		 (
		  (eq sinfo 'chaosnet)
		  (cond (
			(not (eq imp t))
			(princ "The imp is down."))
			(t
		  (princ "The imp is up"))))))

	  ((or (eq comm 'tn) (eq comm 'telnet))
	   (comred 'confirm)
	   (setq cmd nil)
	   (do ((loop-var 0 ()))
	       ((eq cmd 'exit) ())
	  (setq telnet-mode
		(let-comred "TELNET>"
			    (setq cmd (comred 'tnet))
			    (cond (
				   (and (not (eq cmd nil)) 
					(not (eq cmd 'exit)))

			    (comred-force-guideword "Network")
			    (setq ccom (comred 'connect))
			    (cond (
				   (eq ccom 'arpanet)
				    (comred-force-guideword "host")
				    (setq foo (comred 'arpa))
				    (comred 'confirm)
				    (princ "Trying...")
				    (sleep 2) (princ "Refused"))
				  (t
				   (comred-force-guideword "host")
				   (setq foo (comred 'chaos))
				   (comred 'confirm)
				   (cond ((eq foo 'dungeon)
					 (princ "Trying...")
					 (sleep 2)
					 (cond (
						(eq imp t)
						(princ "open")
     			(setq room 7) (setq cmd 'exit) (setq comm 'return)
			(setq state looking) (terpri))
					       (t
						(princ "no chaosnet"))))
					 (t
					  (princ "Trying...")
					  (sleep 2)
					  (princ "Refused")))))))))))))))))
    