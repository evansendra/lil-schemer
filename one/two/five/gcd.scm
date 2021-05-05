; Euclid's algorithm for computing GCD
; makes use of:
; GCD(a,b) = GCD(b,r) where r = (remainder of a / b)
; to reduce until a or b is zero where it will be the remaining term
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))