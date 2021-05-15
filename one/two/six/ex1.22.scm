(load "prime.scm")

; The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of (n), you should expect that testing for primes around 10,000 should take about sqrt(10) ≈ 3 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

; search for primes starting with `start` and ending once we've found `num-primes`
(define (search-for-primes start stop)
  (define (search-itr n stop)
    (cond ((and (= start n) (even? n)) (search-itr (+ n 1) stop))
          ((> n stop) (display "done"))
          (else 
            (timed-prime-test n)
            (search-itr (+ n 2) stop))))
  (search-itr start stop))

; had to update this a bit since processors are faster now, but here's the results
; first 3 primes in 100m: 100 000 000 - 100 000 050 
; 100000007 *** 10, 100000037 *** 10, 100000039 *** 10
; first 3 primes in 1b: 1 000 000 000 - 1 000 000 050 
; 1000000007 *** 30, 1000000009 *** 30, 1000000021 *** 20
; first 3 primes in 10b: 10 000 000 000 - 10 000 000 070 
; 10000000019 *** 70, 10000000033 *** 70, 10000000061 *** 70
; first 3 primes in 100b: 100 000 000 000 - 100 000 000 070 
; 100000000003 *** 230, 100000000019 *** 220, 100000000057 *** 220

; we expect the results to grow on the order or sqrt(n).  Since we increase n by 10x, we expect the results to grow by (sqrt(10)*i) where i is the iteration from the original n, increasing by 10x.  We see above
; i = 0 ≈ 10ms
; i = 1 ≈ 30ms ≈ 3x i = 0
; i = 2 ≈ 70ms ≈ 2x i = 0, ≈ 6x i = 0
; i = 3 ≈ 220ms ≈ 3x i = 2, ≈ 21x i = 0
;  Do your timing data bear this out? -> yes, the timing data support the first iteration almost precisely
; How well do the data for 100,000 and 1,000,000 support the n prediction? -> In our case that's 100x and 1000x the original input.  These findings are less precise, but still do grow proportionally to the input much lower than linearly.  They perform faster than we'd expect, perhaps due to CPU optimization for increased processor time
; Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation? -> Yes