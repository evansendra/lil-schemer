; Exercise 1.41.  Define a procedure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if inc is a procedure that adds 1 to its argument, then (double inc) should be a procedure that adds 2. What value is returned by

; (((double (double double)) inc) 5)

(define (inc a) (+ a 1))
(define (double f)
	(lambda (x) (f (f x))))

; sanity check
; (double inc)
; (x) -> (inc (inc x))

; some predictions of what will happen:
; (((double (double double)) inc) 5)
; (double double) => (x) -> (double (double x))
; (double (double double)) => (x) -> (double (double (double (double x))))
; ((double (double double)) inc) => (x) -> (double (double (double (double (inc x)))))
; ((double (double double)) inc) => (x) -> (double (double (double (inc (inc x)))))
; ((double (double double)) inc) => (x) -> (double (double (inc (inc (inc (inc x)))))))
; ((double (double double)) inc) => (x) -> (double (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))
; ((double (double double)) inc) => (x) -> (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc x))))))))))))))))
; this last one has a total of 16 counts of increment to the parameter x
; when applied to an argument of 5, this will yield 21