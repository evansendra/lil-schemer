(load "average-damp.scm")
(load "../three/fixed-point.scm")

; computes sqrt by first finding a fixed point of the function y = x/y aka y^2 = x
; because y = x/y doesn't converge to a fixed point by repeating the function itself, we use average damping to get the numbers to converge to the fixed point of y = x/y
; average-damp and y = x/y
(define (sqrt x)
	(fixed-point (average-damp (lambda (y) (/ x y)))
								1.0))

; example of re-using the useful sub-procedures of sqrt
; (define (cube-root x)
; 	(fixed-point (average-damp (lambda (y) (/ x (square y))))
; 								1.0))