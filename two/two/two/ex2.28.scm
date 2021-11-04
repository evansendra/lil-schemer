; Exercise 2.28.  Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))

; (fringe x)
; (1 2 3 4)

; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

(define (fringe x)
  (cond ((null? x) ())
        ((pair? x) (append (fringe (car x)) (fringe (cdr x))))
        (else (list x))))

(load "../../../utils/testing.scm")
(define (list= l1 l2)
  (cond ((null? l1) true)
        ((= (car l1) (car l2)) (list= (cdr l1) (cdr l2)))
        (else false)))

(testc (fringe (list 1 2 3 4)) (list 1 2 3 4) list=)
(testc (fringe x) (list 1 2 3 4) list=)
(testc (fringe (list x x)) (list 1 2 3 4 1 2 3 4) list=)
(testc (fringe (list x (list (list (list x))))) (list 1 2 3 4 1 2 3 4) list=)