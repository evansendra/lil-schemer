; Exercise 1.29

; code from chapter
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.
(define (simpsons-rule f a b n)
  (define (h) (/ (- b a) n))
  (define (s-term k)
    (define (mul-by k)
      (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            (else 4)))
    (* (mul-by k) (f (+ a (* k (h))))))
  (* (/ (h) 3.0) (sum s-term 0 inc n)))

; previous results:
; (integral cube 0 1 0.01)
; .24998750000000042
; (integral cube 0 1 0.001)
; .249999875000001

; current results
; 1 ]=> (simpsons-rule cube 0 1.0 1000)
; ;Value: .2500000000000003
; 1 ]=> (simpsons-rule cube 0 1.0 100)
; ;Value: .24999999999999992
