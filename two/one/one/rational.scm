; assumptions
; (make-rat <n> <d>) returns the rational number whose numerator is the integer <n> and whose denominator is the integer <d>
; (numer <x>) returns the numerator of the rational number <x>
; (denom <x>) returns the denominator of the rational number <x>
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; data abstraction
; (define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))

; re-defining make-rat to be in reduced form
(load "../../../one/two/five/gcd.scm")
(define (make-rat-aux n d)
	(let ((g (gcd n d)))
		(cons (/ n g) (/ d g))))

; ex 2.1
; re-define to handle for negatives
; TODO
; (define (make-rat n d)
; 	(cond ((< n 0) 
; 					(if (< d 0)
; 							(make-rat-aux (* n -1) (* d -1))
; 							(make-rat-aux n d))
; 				 (< d 0))))