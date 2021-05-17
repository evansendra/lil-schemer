(define (smallest-divisor n)
  (find-divisor n 2))

; If d is a divisor of n, then so is n/d. But d and n/d cannot both be greater than n.
; theta(sqrt(n)) operations
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next i)
  (if (= i 2) 
      3
      (+ 2 i)))

; using the old procedure (results in ms)
; first 3 primes in 100m: 100 000 000 - 100 000 050 
; 100000007 *** 10, 100000037 *** 10, 100000039 *** 10 
; first 3 primes in 1b: 1 000 000 000 - 1 000 000 050 
; 1000000007 *** 30, 1000000009 *** 30, 1000000021 *** 30 
; first 3 primes in 10b: 10 000 000 000 - 10 000 000 070 
; 10000000019 *** 90, 10000000033 *** 70, 10000000061 *** 70
; first 3 primes in 100b: 100 000 000 000 - 100 000 000 070 
; 100000000003 *** 250, 100000000019 *** 230, 100000000057 *** 230

; using the new procedure
; first 3 primes in 100m: 100 000 000 - 100 000 050 
; 100000007 *** 10, 100000037 *** 10, 100000039 *** 0 
; first 3 primes in 1b: 1 000 000 000 - 1 000 000 050 
; 1000000007 *** 20, 1000000009 *** 20, 1000000021 *** 20 
; first 3 primes in 10b: 10 000 000 000 - 10 000 000 070 
; 10000000019 *** 60, 10000000033 *** 50, 10000000061 *** 50 
; first 3 primes in 100b: 100 000 000 000 - 100 000 000 070 
; 100000000003 *** 160, 100000000019 *** 140, 100000000057 *** 140 

; the ratio of the procedure which increments and that which uses next is a little less than two.  I think this can be accounted for due to (a) the inputs not being very large - the time to execute is small and therefore likely dependent on variables out of our control, (b) the fact that there is likely two parts of the program - "overhead" which is code needed to interpret and run our code regardless which takes some milliseconds and then the actual code we've written which has changed.  (c) randomness in the processes running in the background while the programs are executing and