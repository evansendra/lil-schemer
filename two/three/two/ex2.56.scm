;Exercise 2.56.  Show how to extend the basic differentiator to handle more kinds of expressions. For instance, implement the differentiation rule

; d(u^n)/dx = nu^(n-1) du/dx

;by adding a new clause to the deriv program and defining appropriate procedures exponentiation?, base, exponent, and make-exponentiation. (You may use the symbol ** to denote exponentiation.) Build in the rules that anything raised to the power 0 is 1 and anything raised to the power 1 is the thing itself.

(load "deriv.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
          (make-product (exponent exp) 
              (make-exponentiation (base exp)
                              (make-sum (exponent exp) -1))))
        (else
         (error "unknown expression type -- DERIV" exp))))

; an explonent is a list whose first element is the symbol **:
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

; the base is the second item of the exponentiation list
(define (base expn) (cadr expn))

; the exponent is the third item of the exponentation list
(define (exponent expn) (caddr expn))

(define (make-exponentiation x a)
  (cond ((=number? x 0) 0)
        ((=number? a 0) 1)
        ((and (number? x) (number? a)) (expt x a))
        (else (list '** x a))))

(load "../../../utils/print.scm")
; ; tests
; (print "ex2.56")
; (print (deriv (make-exponentiation 'x 2) 'x))
; ; ==> 2 * x
; (print (deriv (make-exponentiation 'x 0) 'x))
; ; ==> 0
; (print (deriv (make-exponentiation 'x 1) 'x))
; ; ==> 1
; ; deriv
; (print (deriv '(+ x 3) 'x))
; ; ==> 1
; (print (deriv '(* x y) 'x))
; ; ==> y
; (print (deriv '(* (* x y) (+ x 3)) 'x))
; ; ==> (+ (* x y) (* y (+ x 3)))