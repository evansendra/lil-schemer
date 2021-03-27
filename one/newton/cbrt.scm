; newton's method for cube roots:
; if y is an approximation of the cbrt(x), then a better approximation is given by
; x/y^2 + 2y
; ----------
;      3

(define (cbrt-iter-init y x)
  (cbrt-iter y (+ y 1) x))

(define (cbrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      guess
      (cbrt-iter guess
                (improve guess x)
                 x)))

(define (approx x guess)
  (/
    (+ (/ x (square guess)) (* 2 guess))
    3))

(define (improve guess x)
  (average guess (approx x guess)))

(define (average x y)
  (/ (+ x y) 2))

; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
(define (good-enough? prev-guess guess x)
  (< (abs (- guess prev-guess)) 0.001))

(define (cbrt x)
  (cbrt-iter-init 1.0 x))
