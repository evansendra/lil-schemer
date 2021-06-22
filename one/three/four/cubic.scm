; Exercise 1.40: Define a procedure cubic that can be used together with the newtons-method procedure in expressions of the form
; 			(newtons-method (cubic a b c) 1)
; to approximate zeros of the cubic x3 + ax2 + bx + c.
(define (cubic a b c)
	(lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

; example:
; 1 ]=> (newtons-method (cubic 3 2 1) 1)
;Value: -2.3247179572447267

; 1 ]=> (newtons-method (cubic 16 4 326) 1)
;Value: -16.90421954849738