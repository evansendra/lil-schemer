(load "deriv.scm")
(load "../three/fixed-point.scm")

(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

; example
(define (sqrt x)
	(newtons-method (lambda (y) (- (square y) x)) 1.0))