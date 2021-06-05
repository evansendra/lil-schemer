; Exercise 1.36.  Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives shown in exercise 1.22.

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess i)
    (let ((next (f guess)))
      (display i)
      (display ": ")
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next (+ i 1)))))
  (try first-guess 1))

; Then find a solution to x^x = 1000 by finding a fixed point of x -> log(1000)/log(x). (Use Scheme's primitive log procedure, which computes natural logarithms.)
(define (xx) 
  (fixed-point (lambda (n) (/ (log 1000) (log n))) 1.1))

(define (xx-avg-damped) 
  (define (avg a b) (/ (+ a b) 2.0))
  (fixed-point (lambda (n) (avg n (/ (log 1000) (log n)))) 1.1))

; Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.)
; 1 ]=> (xx)
; 1: 72.47657378429035
; 2: 1.6127318474109593
; ...
; 36: 4.555530807938518
; 37: 4.555538934848503
;Value: 4.555538934848503

; 1 ]=> (xx-avg-damped)
; 1: 36.78828689214517
; 2: 19.352175531882512
; ...
; 12: 4.55553957996306
; 13: 4.555536364911781
;Value: 4.555536364911781

; Using average damping we arrive at the result in 13 steps as opposed to 37.