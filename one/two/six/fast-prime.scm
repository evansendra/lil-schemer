; run fermat-test times number of times return true if it is true every time else false
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; run the fermat-test on a given n with a random a, testing if a^n mod n congruent a mod n
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; calculate the exponential of a number mod another number
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