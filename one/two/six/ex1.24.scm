(load "prime.scm")
; (load "ex1.23.scm")
; (load "fast-prime.scm")

; The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (process-time-clock)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (process-time-clock) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; search for primes starting with `start` and ending once we've found `num-primes`
(define (search-for-primes start stop)
  (define (search-itr n stop)
    (cond ((and (= start n) (even? n)) (search-itr (+ n 1) stop))
          ((> n stop) (display "done"))
          (else 
            (timed-prime-test n)
            (search-itr (+ n 2) stop))))
  (search-itr start stop))

; RESULTS FROM RUNNING EX1.22 AGAIN
; had to update this a bit since processors are faster now, but here's the results
; first 3 primes in 100m: 100 000 000 - 100 000 050 
; 100000007 *** 10, 100000037 *** 10, 100000039 *** 10
; first 3 primes in 1b: 1 000 000 000 - 1 000 000 050 
; 1000000007 *** 30, 1000000009 *** 30, 1000000021 *** 20
; first 3 primes in 10b: 10 000 000 000 - 10 000 000 070 
; 10000000019 *** 70, 10000000033 *** 70, 10000000061 *** 70
; first 3 primes in 100b: 100 000 000 000 - 100 000 000 070 
; 100000000003 *** 230, 100000000019 *** 220, 100000000057 *** 220

; RESULTS FROM THIS EXERCISE
; first 3 primes in 100m: 100 000 000 - 100 000 050 
; 100000007 *** 40, 100000037 *** 40, 100000039 *** 40
; first 3 primes in 1b: 1 000 000 000 - 1 000 000 050 
; 1000000007 *** 50, 1000000009 *** 40, 1000000021 *** 40
; first 3 primes in 10b: 10 000 000 000 - 10 000 000 070 
; 10000000019 *** 60, 10000000033 *** 40, 10000000061 *** 40
; first 3 primes in 100b: 100 000 000 000 - 100 000 000 070 
; 100000000003 *** 60, 100000000019 *** 60, 100000000057 *** 50 

; Since the Fermat test has theta(log(n)) growth, how would you expect the time to test primes near 100b to compare with time needed to test primes near 100m?  Do your data bear this out?  Can you explain any discrepancy you found?
; We would expect the time to test 100b = 1000 * 100m to be about 11/8 times the results of 100m.  This is because log(100m) = 8, log(100b) = 11.  If we translate this onto our result of the run for 100m  whose runtime was ≈ 40ms, we expect (11/8)*40 ≈ 55.  This corresponds almost exactly to the results we observed, on average.
; One thing we see which we may not expect initially is that the results for 100m and 1b are actually slower than our prime? proceudre.  This is due to the fact that prime, while theta(sqrt(n)) has no constant multiplier.  Contrast this to our fast-prime? procedure which is actually c * theta(n) where c is proportional to the number of ``times'' we choose to check in fast-prime?  Hence:
; n = 100m, √n = 10000, 1000log(n) = 8000
; n = 1b, √n ≈ 31622, 1000log(n) = 9000
; as you can see, in theory, fast-prime? should still run faster, but these resutls are close enough that it may be explainable by differences in when these procedures were run in the computer.  Far more different than when the input is, say, 10b
; n = 10b, √n = 100000, 1000log(n) = 10000