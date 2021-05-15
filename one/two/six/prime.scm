(define (smallest-divisor n)
  (find-divisor n 2))

; If d is a divisor of n, then so is n/d. But d and n/d cannot both be greater than n.
; theta(sqrt(n)) operations
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))