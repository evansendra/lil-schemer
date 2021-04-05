(load "new-if.scm")

; compares one guess and the next until the two guesses are within 0.001 of each other meaning we've reached sufficient approximation of sqrt(x)

(define (square guess)
  (* guess guess))

(define (sqrt-iter prev-guess guess x)
  (if (good-enough-relative? prev-guess guess x)
      guess
      (sqrt-iter guess
                (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
; TODO add (* guess 0.001) as test
(define (good-enough-relative? prev-guess guess x)
  (< (abs (- guess prev-guess)) (abs (* guess 0.001))))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))
