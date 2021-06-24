(load "../three/fixed-point.scm")
(load "repeated.scm")
(load "average-damp.scm")

; experiment by modifying m such that m is the number of average damps to compute
; an nth-root
; n is the root; m the number of repeats of average damping
; ex (nth-root 4 625 2) = 5.000000000004688
; ex (nth-root 4 625 1) doesn't converge (runs indefinitely)
(define (nth-root n x m)
	(fixed-point ((repeated average-damp m)
								(lambda (y) (/ x (expt y (- n 1))))) 
								1.0))

; results
; (nth-root n x 0) -> works up until n = 2
; (nth-root n x 1) -> works up until n = 4
; (nth-root n x 2) -> works up until n = 8
; (nth-root n x 3) -> works up until n = 16