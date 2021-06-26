(load "../three/fixed-point.scm")
(load "repeated.scm")
(load "average-damp.scm")

; experiment by modifying m such that m is the number of average damps to compute
; an nth-root
; n is the root; x is the number; m the number of repeats of average damping
; ex (nth-root-exp 4 625 2) = 5.000000000004688
; ex (nth-root-exp 4 625 1) doesn't converge (runs indefinitely)
(define (nth-root-exp n x m)
	(fixed-point ((repeated average-damp m)
								(lambda (y) (/ x (expt y (- n 1))))) 
								1.0))

; results
; (nth-root n x 0) -> works up until n = 2
; (nth-root n x 1) -> works up until n = 4
; (nth-root n x 2) -> works up until n = 8
; (nth-root n x 3) -> works up until n = 16

; Use this to implement a simple procedure for computing nth roots using fixed-point, average-damp, and the repeated procedure of Exercise 1.43. Assume that any arithmetic operations you need are available as primitives.
; so in order to genearlize this we can use the integer portion (rounded down) 
; log base 2 of n 

; log base b of a
(define (log-base b a)
	(/ (log a) (log b)))

; n the nth root to be taken
; x the number whose nth root we're finding
(define (nth-root n x)
	(let ((damps (floor (log-base 2 n))))
		(fixed-point ((repeated average-damp damps)
									(lambda (y) (/ x (expt y (- n 1)))))
									1.0)))

; some testing...

; 5^4
; 1 ]=> (nth-root 4 625)
;Value: 5.000000000004688

; 10^10
; 1 ]=> (nth-root 10 10000000000)
;Value: 10.000001863218898

; 521^3
; 1 ]=> (nth-root 3 141420761)
;Value: 521.0000033230573