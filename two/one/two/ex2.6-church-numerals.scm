; Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the  calculus.

; Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).

; substitution of (add-1 zero)
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add-church a b)
	(lambda (f) (lambda (x) ((a f) ((b f) x)))))

; what we want is to combine a e.g. (f x) and b e.g. (f (f x)) such that we get
; a + b = (f (f (f x)))
; to do this, we must apply a to the output of b

; substitution to show it works
; (add-church one two)
; (lambda (f) (lambda (x) ((one f) ((two f) x))))
; (lambda (f) (lambda (x) ((one f) (((lambda (f) (lambda (x) (f (f x)))) f) x))))
; (lambda (f) (lambda (x) ((one f) ((lambda (x) (f (f x))) x))))
; (lambda (f) (lambda (x) ((one f) (f (f x)))))
; (lambda (f) (lambda (x) (((lambda (f) (lambda (x) (f x))) f) (f (f x)))))
; (lambda (f) (lambda (x) ((lambda (x) (f x)) (f (f x)))))
; (lambda (f) (lambda (x) (f (f (f x)))))

; so if we apply this using ++ as f and 0 as x,
; (((add-church one two) ++) 0) should yield three