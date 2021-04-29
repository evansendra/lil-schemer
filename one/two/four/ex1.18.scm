; Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps
(define (* a b)

  ; store in c the resulting product so far
  (define (*i a b c)
    (cond ((= b 0) c)
        ((even? b) (*i (double a) (halve b) c))
        (else (*i a (- b 1) (+ a c)))))

  (*i a b 0))

(define (halve a)
  (/ a 2))

(define (double a)
  (+ a a))

; (* 2 2)
; (* 2 2 0)
; (*i 4 1 0)
; (*i 4 0 4)
; 4

; (* 2 3)
; (*i 2 3 0)
; (*i 2 2 2)
; (*i 4 1 2)
; (*i 4 0 6)
; 6
