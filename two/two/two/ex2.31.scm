; Exercise 2.31.  Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property that square-tree could be defined as

; (define (square-tree tree) (tree-map square tree))

; from 2.30
; (define (square-tree-map tree)
;   (map (lambda (subtree)
;         (if (pair? subtree) 
;           (square-tree-map subtree)
;           (square subtree)))
;     tree))

(define (tree-map proc tree)
  (map (lambda (subtree)
        (if (pair? subtree) 
          (tree-map proc subtree)
          (proc subtree)))
    tree))

(define (square-tree tree) (tree-map square tree))

(define l (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define nil '())
(define (square x) (* x x))

(load "../../../utils/testing.scm")
(load "ex2.30.scm")
(testc (square-tree-map l) (tree-map square l) list=)