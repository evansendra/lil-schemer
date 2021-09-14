; Exercise 2.30.  Define a procedure square-tree analogous to the square-list procedure of exercise 2.21. That is, square-list should behave as follows:

; (square-tree
;  (list 1
;        (list 2 (list 3 4) 5)
;        (list 6 7)))
; (1 (4 (9 16) 25) (36 49))

; Define square-tree both directly (i.e., without using any higher-order procedures) and also by using map and recursion.

(define l (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define nil '())
(define (square x) (* x x))

; without higher order procedures
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; with recursion and map
(define (square-tree-map tree)
  (map (lambda (subtree)
        (if (pair? subtree) 
          (square-tree-map subtree)
          (square subtree)))
    tree))

(load "../../../utils/testing.scm")
(testc (square-tree l) (list 1 (list 4 (list 9 16) 25) (list 36 49)) list=)
(testc (square-tree-map l) (list 1 (list 4 (list 9 16) 25) (list 36 49)) list=)