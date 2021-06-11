; Exercise 1.39: A continued fraction representation of the tangent function was published in 1770 by the German math- ematician J.H. Lambert:
; tanx = x 
; 			 ---------------
; 			 1 − x^2
; 				   -----------
; 					 3 - x^3
; 							 -------
; 								5 - ..
;  where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert’s formula. k specifies the number of terms to compute, as in Exercise 1.37.
(define (pow a b)
	(if (= b 0)
			1
			(* a (pow a (- b 1)))))

(define (tan-cf x k)
	(define (cont-frac-iter count n d res)
		(if (= count 0)
				res
				(cont-frac-iter (- count 1) n d (/ (n count) (- (d count) res)))))
	(cont-frac-iter k
									(lambda (i) (pow x i))
									(lambda (i) (- (* 2 i) 1))
									0))