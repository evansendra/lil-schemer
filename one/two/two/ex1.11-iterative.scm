; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.
(define (f n)
  (define (f-iterator i fnm1 fnm2 fnm3)
    (if (= i n)
      (+ fnm1 (* 2 fnm2) (* 3 fnm3))
      (f-iterator (+ i 1) (+ fnm1 (* 2 fnm2) (* 3 fnm3)) fnm1 fnm2)))

  (if (< n 3)
    n
    (f-iterator 3 2 1 0)))
