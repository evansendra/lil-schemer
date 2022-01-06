(define nil '())
(load "flatmap.scm")

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

; 1 (2 3)
; 2 (1 3)
; 3 (1 2)

; (2 3) -> 2 (3)
; (2 3) -> 3 (2)

; (3) -> (3) cons with nil is just (3)
; (2) -> (2)

; 1 2 3
; 1 3 2

; and so on for 2 1 3, 2 3 1 as well as 3 1 2, 3 2 1...