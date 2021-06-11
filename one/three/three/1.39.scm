; Exercise 1.39: A continued fraction representation of the tangent function was published in 1770 by the German math- ematician J.H. Lambert:
; tanx = x 
; 			 ---------------
; 			 1 − x^2
; 				   -----------
; 					 3 - x^3
; 							 -------
; 								5 - ..
;  where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert’s formula. k specifies the number of terms to compute, as in Exercise 1.37.
(define (tan-cf x k)
	; intstead of re-writing cont-frac-iter, we could repurpose a more abstract version of cont-frac-iter where the operation performed in the denominator is abstracted so we could use "/" instead of "*" as in 1.37
	(define (cont-frac-iter count n d res)
		(if (= count 0)
				res
				(cont-frac-iter (- count 1) n d (/ (n count) (- (d count) res)))))
	(cont-frac-iter k
									(lambda (i) (if (< i 2) x (square x))) ; raise to the 2nd power if k>2
									(lambda (i) (- (* 2 i) 1))
									0))

; usage

; 1 ]=> (tan-cf 2.0 3)

; Value: -2.1850398632626273

; 1 ]=> (tan-cf 3.14159 10)

;Value: -2.6554829755074223e-6

; 1 ]=> (tan-cf 555.0 1000)

;Value: -1.7924004878260433