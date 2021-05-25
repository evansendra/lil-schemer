; run miller-rabin-test times number of times return true if it is true every time else false
(define (fast-prime-mr? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime-mr? n (- times 1)))
        (else false)))

; run the miller-rabin-test on a given n with a random a, testing if a^(n-1) mod n congruent 1 mod n
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; calculate the exponential of a number mod another number
(define (expmod base exp m)

  ; calculate if we have a nontrivial sqrt 1 mod n (not equal to 1 or n - 1)
  (define (non-trivial-sqrt? x)
    ; calculate the remainder of the square of a mod b
    ; doing this so hopefully the result is stored and not done twice in (cond ...) below
    (define (remainder-square a b)
      (remainder (square a) b))
    (cond ((and (= (remainder-square x m) 1) (not (= x 1)) (not (= x (- m 1)))) 0)
          (else (remainder-square x m))))

  (cond ((= exp 0) 1)
        ((even? exp) 
            (non-trivial-sqrt? (expmod base (/ exp 2) m)))
        (else 
            (remainder (* base (expmod base (- exp 1) m))
                        m))))

; It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime. It is also possible to prove that if n is an odd number that is not prime, then, for at least half the numbers a<n, computing an-1 in this way will reveal a nontrivial square root of 1 modulo n.

; ### TESTING ###
; 1 ]=> (fast-prime-mr? 3 10)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 4 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 4 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 5 10)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 6 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 7 10)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 8 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 9 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 10 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 11 10)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 12 10)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 100000037 1000)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 100000000019 1000)

; ;Value: #t

; 1 ]=> (fast-prime-mr? 100000000020 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 100000000021 1000)

; ;Value: #f

; Carmichael numbers...
; 1 ]=> (fast-prime-mr? 561 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 1105 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 1729 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 2465 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 2821 1000)

; ;Value: #f

; 1 ]=> (fast-prime-mr? 6601 1000)

; ;Value: #f
; ### END TESTING ###