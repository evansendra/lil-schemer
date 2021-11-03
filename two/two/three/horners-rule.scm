; ex 2.34
(load "accumulate.scm")
(define (horner-eval x coefficient-sequence) 
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

; example usage
(horner-eval 2 (list 1 3 0 5 0 1))
; expected 79