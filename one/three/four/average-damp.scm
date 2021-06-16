(load "../average.scm")

; returns a procedure whose value is the average of x and f(x)
; example usage: ((average-damp square) 10) -> 55
(define (average-damp f)
	(lambda (x) (average x (f x))))