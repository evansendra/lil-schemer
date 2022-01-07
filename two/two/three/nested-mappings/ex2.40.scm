; Exercise 2.40: Define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i, j) with 1 ≤ j < i ≤ n. Use unique-pairs to simplify the definition of prime-sum-pairs given above.
(define nil '())
(define (enumerate low high)
  (if (> low high)
    nil
    (cons low (enumerate (+ low 1) high))))
(load "../accumulate.scm")
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (unique-pairs n)
  (flatmap (lambda (i) 
           (map (lambda (j) (list i j)) (enumerate 1 (- i 1))))
           (enumerate 1 n)))