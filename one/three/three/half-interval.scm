; checks inputs to determine if a and b are such that either
; f(a) < 0 < f(b)
; or
; f(b) < 0 < f(a)
; otherwise signals error as we then can't use the half interval method
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

; half-interval method for finding roots or zeroes of a function f between neg-point and pos-point
; neg-point should be a such that f(a) < 0
; pos-point should be b such that f(b) > 0
; search finds the x for which f(x) = 0 between a and b
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

; determines whether or not two points are within a given difference
; in which case they are considered "close enough"
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

; average of x and y
(define (average x y)
  (/ (+ x y) 2.0))

; testing
; with lambda
; (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      ; 1.0
                      ; 2.0)

; (half-interval-method sin 2.0 4.0)
; 3.14111328125