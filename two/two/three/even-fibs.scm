(load "../../../one/two/two/fib.scm")

(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib-iter k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))