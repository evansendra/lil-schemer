(load "accumulate.scm")
(load "ex2.36.scm") ; (accumulate-n)
(define nil '())

(define v1 (list 1 2))
(define v2 (list 3 4))
(define m1 (list v1 v2))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v) 
  (map (lambda (i) (accumulate + 0 (accumulate-n * 1 (list i v)))) m))
  ; for each row i in m
    ; create a sum of 
      ; multiplication mij * vj

; testing...
; m1 * v1 = 1*1 + 2*2 = 5
;           3*1 + 4*2   11
; aka
; (matrix-*-vector m1 v1) -> (5 11)

; (transpose m1) -> 1 3 -> ((1 3) (2 4))
;                   2 4
(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)))