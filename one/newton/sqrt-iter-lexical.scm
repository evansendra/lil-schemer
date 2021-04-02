(load "new-if.scm")

; compares one guess and the next until the two guesses are within 0.001 of each other meaning we've reached sufficient approximation of sqrt(x)
(define (sqrt x)
  (define (square guess)
    (* guess guess))
  (define (average a b)
    (/ (+ a b) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough-relative? prev-guess guess)
    (< (abs (- guess prev-guess)) (abs (* guess 0.001))))
  (define (sqrt-iter prev-guess guess)
    (if (good-enough-relative? prev-guess guess)
        guess
        (sqrt-iter guess
                  (improve guess))))

  (sqrt-iter 1.0 2.0))
