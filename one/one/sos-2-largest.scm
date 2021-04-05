(define (sos a b)
	(+ (* a a) (* b b)))

(define (sos-2-largest a b c)
	(if (> a b)
		(if (> b c) 
			(sos a b)
			(sos a c))
		(if (> a c)
			(sos a b)
			(sos b c))))
		
