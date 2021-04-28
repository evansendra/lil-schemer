; Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps
(define (* a b)
  (define (*i a b c)
    ; store in c the resulting product so far which shouldn't change
    (cond ((= b 0) c)
        ((even? b) (*i a (halve b) (double c)))
        (else (*i a (- b 1) (+ a c))))
  )
  (*i a b 0)
)

; (* 2 2)
; broken


; (* 2 3)
; (*i 2 3 0)
; (*i 2 2 2)
; (*i 2 (halve 2) (double 2))
; (*i 2 1 4)
; (*i 2 0 6)
; 6

(define (halve a)
  (/ a 2))

(define (double a)
  (+ a a))
