; exercise 1.27
; Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer n and tests whether an is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael numbers.
; There are 255 Carmichael numbers below 100,000,000. The smallest few are 561, 1105, 1729, 2465, 2821, and 6601
;1 ]=> (slow-prime? 561)
;Value: #t 
; 1 ]=> (slow-prime? 1105)
;Value: #t
; 1 ]=> (slow-prime? 1729)
;Value: #t
; 1 ]=> (slow-prime? 2465)
;Value: #t
; 1 ]=> (slow-prime? 2821)
;Value: #t
; 1 ]=> (slow-prime? 6601)
;Value: #t


; start the testing with a n and the lowest positive integer less than n (1) as start value of a
(define (slow-prime? n)
  (slow-prime-test n 1))

; run fermat-test for all positive integers < n: return true if it is true every time else false
(define (slow-prime-test n a)
  (cond ((= a (- n 1)) true)
        ((fermat-test n a) (slow-prime-test n (+ a 1)))
        (else false)))

; run the fermat-test on a given n and a, testing if a^n mod n congruent a mod n
(define (fermat-test n a)
    (= (expmod a n n) a))

; calculate the exponential of a number mod another number in logarithmic time
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) 
            (remainder (square (expmod base (/ exp 2) m))
                        m))
        (else 
            (remainder (* base (expmod base (- exp 1) m))
                        m))))

; 3^2 mod 2 = 9 mod 2 = 1

; 3^2 mod 2
; (expmod 3 2 2)
; (remainder (square (expmod 3 1 2)) 2)
; (remainder (square (remainder (* 3 (expmod 3 0 2)) 2)) 2)
; (remainder (square (remainder (* 3 1) 2)) 2)
; (remainder (square (remainder 3 2)) 2)
; (remainder (square 1) 2)
; (remainder 1 2)
; 1