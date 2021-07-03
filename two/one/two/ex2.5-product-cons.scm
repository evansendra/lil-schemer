; Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2^a * 3^b. Give the corresponding definitions of the procedures cons, car, and cdr.
(define (cons a b)
	(* (expt 2 a) (expt 3 b)))

(define (logb base arg)
	(/ (log arg) (log base)))

; divide a by b until you can't divide a by b (without a remainder) no mo
; if a is divisible evenly by b, returns a/b else returns a
; (divnomo 18 3)
; (divnomo 6 3)
; (divnomo 2 3)
; 2
(define (divnomo a b)
	(if (= (remainder a b) 0)
			(divnomo (/ a b) b)
			a))

; what if instead since 2 and 3 share only gcd of 1, we use 2 and 3 to 
; hyp: we have a product p = 2^a * 3^b, we can get just the a or b portion (2^a or 3^b)
; by continuously dividing by 2 or 3 until we have a number that is only divisible by the other number
; a = 1, b = 1
; 2*3 = 6
; 2^a = 6/3 = 2 -> can't be divided by 3 anymore, so logbase 2 of 2 = 1
; a = 3, b = 2
; 2^3 * 3^2 = 8 * 9 = 72
; 72/2 = 36/2 = 18/2 = 9 -> can't be divided by 2 anymore, logbase 3 of 9 = 2
; a = 2, b = 2
; 2^1 * 3^2 = 2 * 9 = 18
; get a -> 18/3 = 6 / 3 = 2 can't be divied by 3 anymore so logbase 2 of 2 = 1
; get b -> 18/2 = 9 -> can't be divided by 2 anymore so logbase 3 of 9 = 2
(define (car p)
	(logb 2 (divnomo p 3)))

(define (cdr p)
	(logb 3 (divnomo p 2)))

; original strategy that didn't work
; to get a, we need to do some arithmetic on 2^a*3^b to "unfold it" out of the product
; if p = 2^a
; a = log2(p)
; if p = 3^b
; b = log3(p)
; if p = 2^a * 3^b
; a = log2(p / (3^log3(p)))

; ALTERNATIVE
; doesn't use log base b

; counts how many times x can be divided by divisor with zero remainder
(define (count-zero-divs x divisor)
	(define (iter x divisor count)
		(if (= (remainder x divisor) 0)
				(iter (/ x divisor) divisor (+ count 1))
				count))
	(iter x divisor 0))

(define (cons a b)
	(* (expt 2 a) (expt 3 b)))

(define (car p) (count-zero-divs p 2))
(define (cdr p) (count-zero-divs p 3))

; basically what this does better than my original solution is recognize that
; we don't need to reduce the result by the other base of the exponent, we can
; go after the term we want directly by simply counting the number of divisions
; of its base

; EASIER READ USING RECURSIVE PROCESS
(define (cons a b)
	(* (expt 2 a) (expt 3 b)))

(define (zero-divs a b)
	(if (= (remainder a b) 0)
			(+ 1 (zero-divs (/ a b) b))
			0))

(define (car p) (zero-divs p 2))
(define (cdr p) (zero-divs p 3))