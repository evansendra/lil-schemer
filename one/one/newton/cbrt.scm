; newton's method for cube roots:
; if y is an approximation of the cbrt(x), then a better approximation is given by
; x/y^2 + 2y
; ----------
;      3

(define (square guess)
  (* guess guess))

(define (cbrt-iter-init y x)
  (cbrt-iter y (+ y 1.1) x))

(define (cbrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      guess
      (cbrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (/
    (+ (/ x (square guess)) (* 2 guess))
    3))

(define (print n)
  (display n) (newline))

; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
(define (good-enough? prev-guess guess x)
  ; below line would give answer to best of system's precision - iterating until guess and prev-guess are "equal"
  ; (= guess prev-guess))
  (< (abs (- guess prev-guess)) (abs (* guess 0.001))))

(define (cbrt x)
  (cbrt-iter-init 0 x))
