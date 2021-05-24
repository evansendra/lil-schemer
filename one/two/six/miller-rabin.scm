; run fermat-test times number of times return true if it is true every time else false
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; run the fermat-test on a given n with a random a, testing if a^n mod n congruent a mod n
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; calculate the exponential of a number mod another number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) 
            (if (= (remainder (square (expmod base (/ exp 2) m)) m) 1) 
                    0))
        (else 
            (remainder (* base (expmod base (- exp 1) m))
                        m))))

; It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime. It is also possible to prove that if n is an odd number that is not prime, then, for at least half the numbers a<n, computing an-1 in this way will reveal a nontrivial square root of 1 modulo n.

; exp is 0
; 1
; exp is even
; (if (= (remainder (square (expmod base (/ exp 2) m)) m) 1) 0))
; exp is odd
; (remainder (* base (expmod base (- exp 1) m)) m) 

; (= (expmod 3 6 7) 1)
; (= (expmod 3 6 7) 1)
; (if (= (remainder (square (expmod 3 (/ 6 2) 7)) 7) 1) 0))
; (expmod 3 3 7)
; (remainder (* 3 (expmod 3 (- 3 1) 7)) 7) 
; (expmod 3 2 7) 
; (if (= (remainder (square (expmod 3 (/ 2 2) 7)) 7) 1) 0))
; (expmod 3 1 7)
; (remainder (* 3 (expmod 3 0 7)) 7) 
; (expmod 3 0 7)
; 1
; line 40: 3
; line 38: (if (= (remainder (square 3) 7) 1) 0))
; line 38: (if (= 2 1) 0))
; this ends up stopping with no return value here, needs work...