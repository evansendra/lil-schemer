; Write an analogous procedure called product that returns the product of the values of a function at points over a given range. 
(define (product f a b)
  (if (> a b)
    1
    (* (f a) (product f (+ a 1) b))))

; Show how to define factorial in terms of product. 
(define (identity a) a)
(define (! n)
  (product identity 1 n))

; If we wanted to be even more abstract we could do
; (define (product term a next b)
;   (if (> a b)
;     1
;     (* (term a) (product term (next a) next b))))
; (define (++ i) (+ i 1))
; (define (! n)
;   (product identity 1 ++ b))

; Also use product to compute approximations to π using the formula
; π   2 * 4 * 4 * 6 * 6 * 8 * ...
; - = ---------------------------
; 4   3 * 3 * 5 * 5 * 7 * 7 * ...
; pi-approx computes the approximation of π, where i is the number of iterations
; greater i = closer approxmiation
(define (pi-approx i)
  (define (term x)
    ; 1,  2,  3,  4,  5,  6,  ...
    ; 2 * 4 * 4 * 6 * 6 * 8 * ...
    ; ---------------------------
    ; 3 * 3 * 5 * 5 * 7 * 7 * ...
    (if (even? x) 
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (* 4 (product term 1.0 i)))

; testing
; ;  1 ]=> (pi-approx 100)

; ;Value: 3.1570301764551645

; 1 ]=> (pi-approx 1000)

; ;Value: 3.143160705532257

; 1 ]=> (pi-approx 10000)

; ;Value: 3.1417497057379635

; 1 ]=> (pi-approx 100000)

; ;Value: 3.1416083612780903

(define (product-iter f a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (+ a 1)
              (* (f a) result))))
  (iter a 1))

(define (!-iter n)
  (define (identity a) a)
  (product-iter identity 1 n))

; and we could do the same for pi-approx