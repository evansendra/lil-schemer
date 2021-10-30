; we can reuse pieces from the sum-odd-squares and even-fibs procedures in a program that con- structs a list of the squares of the first n + 1 Fibonacci numbers
(load "signal-flow-even-fibs.scm")
(load "signal-flow-sum-odd-squares.scm")
(load "../../../one/two/two/fib.scm")

(define nil '())
(define (square x) (* x x))

(define (list-fib-squares n)
  (accumulate cons nil
    (map square (map fib (enumerate-interval 0 n)))))

(list-fib-squares 10)