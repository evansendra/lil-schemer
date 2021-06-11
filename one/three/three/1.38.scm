; Exercise 1.38: In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for e − 2, where e is the base of the natural logarithms. In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, . . .. Write a program that uses your cont-frac procedure from Exercise 1.37 to approximate e, based on Euler’s expansion.

; 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, ... 
; 1, 2, 1, 1, 4, 1, 1, 6, 1,  1,  8,  1,  1,  10,  1,  1, 12, ... 
; n = i + 1
; if n r 3 = 0,
	; Di = 2 * (n / 3) 
; else
	; Di = 1 
; i = 2, n = 3, Di = 2 * (3 / 3)  = 2
(define (em2-di i)
	(let ((n (+ i 1)))
		(if (= (remainder n 3) 0)
				(* 2 (/ n 3))
				1)))

(load "1.37.scm")

; example usage
; (cont-frac-iter (lambda (i) 1.0)
; 								em2-di
; 								10
; 								0)