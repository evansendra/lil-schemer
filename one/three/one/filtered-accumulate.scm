; ex1.33
; You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:
; previous accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

; in terms of accumulate
(define (filtered-accumulate combiner null-value term a next b filter)
  ; combine the current with the next terms if filter 
  (define (combine-if current next-terms)
    (if (filter current)
        (combiner current next-terms)
        next-terms))
  (accumulate combine-if null-value term a next b))

; from scratch
(define (filtered-accumulate-custom combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (combiner (if (filter a)
                    (term a)
                    null-value)
                    (filtered-accumulate combiner null-value term (next a) next b filter))))

; easy test -> sum of all even numbers in a to b
(define (i a) a)
(define (++ i) (+ i 1))
; (filtered-accumulate + 0 i 0 ++ 5 even?) -> 6

; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
(load "../../two/six/prime.scm")
; add the current square to the next group of terms
(define (add-square x y) (+ (* x x) y))
(define (sos-primes a b)
  (filtered-accumulate add-square 0 i a ++ b prime?))
; (sos-primes 2 10) -> 2^2, 3^2, 5^2, 7^2 -> 87

; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).
(define (prod-rel-primes n)
  ; x is relatively prime to n if GCD(n,x) = 1
  ; here we assume n > x based on the definition of the top level procedure ("positive integers less than n")
  (define (gcd a b)
    ; taken from "../../two/five/gcd.scm"
    (if (= b 0) 
        a 
        (gcd b (remainder a b))))
  (define (rel-prime? x)
    (= (gcd n x) 1))
  (filtered-accumulate * 1 i 1 ++ (- n 1) rel-prime?))
; testing
; (prod-rel-primes 10)
; 1,3,7,9 -> 189 