; Given a positive integer n, find all ordered pairs of distinct positive integers i and j, where 1 ≤ j < i ≤ n, such that i + j is prime

; e.g. n = 6
; i   2 3 4 4 5 6 6
; j   1 2 1 3 2 1 5
; i+j 3 5 5 7 7 7 11

; a number is prime if and only if it's divisible by only 1 and itself
(define (prime? x)
  (define (prime-rec? x div)
    (cond ((> div (sqrt x)) true) 
      ((= (modulo x div) 0) false)
      (else (prime-rec? x (+ div 1)))))
  (prime-rec? x 2))

(define nil '())
(define (enumerate low high)
  (if (> low high)
    nil
    (cons low (enumerate (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (list-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate 1 (- i 1)))) (enumerate 1 n)))

(define (prime-pair? pair)
  (prime? (+ (car pair) (cadr pair))))

; (load "ex2.40.scm") ; equivalent to `list-pairs` above
; can use `unique-pairs` as defined above to get same result as part of exercise 2.40
(define (prime-sum-pairs n)
  (map (lambda (p) (list (car p) (cadr p) (+ (car p) (cadr p)))) (filter prime-pair? (list-pairs n))))