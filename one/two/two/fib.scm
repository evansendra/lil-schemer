; @param n number the number for which to compute the fibonacci sequence
; n >= 0
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib-iter n)
  (define (fib-iterator a b i)
    (if (= i 0)
      a
      (fib-iterator (+ a b) a (- i 1))))

  (if (< n 2)
    n
    (fib-iterator 0 1 n)))
