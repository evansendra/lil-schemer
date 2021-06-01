; f(r,y) = r(1+ry)^2 + y(1-y) + (1+ry)(1-y)
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y)) 
            (- 1 y)))

; could also be re-written as

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

; which could be re-written using the special form let

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

; incrementing a number
(let ((a (+ 5 2)))
  (+ a 1))
; which is equivalent to
((lambda (a) (+ a 1)) (+ 5 2))

(define x 2)
(let ((x 3)
      (y (+ x 2)))
  (* x y))
; yields 12 which becomes more obvious when looking at 
((lambda (x y) (* x y)) 3 (+ x 2))
; becuase the x referenced in the second argument is outside the body of the lambda where x is defined as 3 