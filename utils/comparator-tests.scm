(load "testing.scm")

(testc (list 1 2 3) (list 1 2 3) list=) ;true
(testc (list 1 2 3 4 5) (list 1 2 3 4 5) list=) ;true
(testc (list 1 2 3 4 5) (list 1 2 3 4 6) list=) ;false
(testc (list 1 2 3 4 5) (list 1 2 3 4) list=) ;false