; Exercise 1.42.  Let f and g be two one-argument functions. The composition f after g is defined to be the function x  f(g(x)). Define a procedure compose that implements composition. For example, if inc is a procedure that adds 1 to its argument,

; ((compose square inc) 6)
; 49

(define (compose f g)
	(lambda (x) (f (g x))))

; playing this out...
; ((compose square inc) 6)
; (((x) -> (square (inc (x)))) 6)
; (square (inc (6)))
; (square 7)
; 49