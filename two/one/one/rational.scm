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

(load "../../../one/two/five/gcd.scm")

; Exercise 2.1.  Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.
; re-define to handle for negatives
(define (make-rat n d)
  ; constructs a pair defined by a numerator a, denominator b, and common divisor x
  (define (div-by a b x)
    (cons (/ a x) (/ b x)))
  (let ((g (gcd (abs n) (abs d))))
    (cond ((and (< n 0) (< d 0))   ; both are negative; the rational is a positive
            (div-by (abs n) (abs d) g))
          ((or (< n 0) (< d 0))    ; one is negative; the rational is a negative
            (div-by (* -1 (abs n)) (abs d) g))
          (else (div-by n d g))))) ; both are positive; the rational is positive

; alternate solution from http://community.schemewiki.org/?sicp-ex-2.1
; this makes use of the fact that the sign of the divisor will influence the resutlting
; sign of the overall rational
; n d g n/g d/g rat
; + + +  +   +   +
; - + +  -   +   -
; + - -  -   +   -
; - - -  +   +   +
(define (make-rat-alt n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (display g)
    (cons (/ n g) (/ d g))))

; testing
; 1 ]=> (print-rat (make-rat 1 2))
; 1/2
; 1 ]=> (print-rat (make-rat -1 2))
; -1/2
; 1 ]=> (print-rat (make-rat 1 -2))
; -1/2
; 1 ]=> (print-rat (make-rat -1 -2))
; 1/2