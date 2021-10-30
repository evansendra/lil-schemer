(load "../../../one/two/two/fib.scm")
(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

; example usage: (enumerate-interval 2 7) -> (2 3 4 5 6 7)
(define (even-fibs n)
  (accumulate cons nil (filter even? (map fib (enumerate-interval 0 n)))))

(even-fibs 5) ; outputs (0 2)