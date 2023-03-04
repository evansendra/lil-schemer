(load "../../../utils/testing.scm")
(load "../../../utils/print.scm")
(load "ex2.56.scm")

; Exercise 2.58.  Suppose we want to modify the differentiation program so that it works with ordinary mathematical notation, in which + and * are infix rather than prefix operators. Since the differentiation program is defined in terms of abstract data, we can modify it to work with different representations of expressions solely by changing the predicates, selectors, and constructors that define the representation of the algebraic expressions on which the differentiator is to operate.

; a. Show how to do this in order to differentiate algebraic expressions presented in infix form, such as (x + (3 * (x + (y + 2)))). To simplify the task, assume that + and * always take two arguments and that expressions are fully parenthesized.

(define expected1 4)
(print "sanity check testing originally expected behavior")
(test (deriv '(+ x (* 3 (+ x (+ y 2)))) 'x) 4)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

; v1
; (define (make-product m1 m2) (list '* m1 m2))
; v2 reduced
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

; A sum is a list whose second element is the symbol +:
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

; The addend is the first item of the sum list:
(define (addend s) (car s))

; The augend is the third item of the sum list:
(define (augend s) (caddr s))

; A product is a list whose second element is the symbol *:
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

; The multiplier is the first item of the product list:
(define (multiplier p) (car p))

; The multiplicand is the third item of the product list:
(define (multiplicand p) (caddr p))

(print "test with updated infix notation...")
(test (deriv '(x + (3 * (x + (y + 2)))) 'x) 4)

; b. The problem becomes substantially harder if we allow standard algebraic notation, such as (x + 3 * (x + y + 2)), which drops unnecessary parentheses and assumes that multiplication is done before addition. Can you design appropriate predicates, selectors, and constructors for this notation such that our derivative program still works?

(test (deriv '(x + 3 * (x + y + 2)) 'x) 4)
; how can we modify the predicates, selectors, and constructors such that this notation can be input and the deriv procedure will work?
; selectors will need to be adjusted such that the exponent, augend, and multiplicand is everything to the right of the operator
; constructors and predicates would both need heavy modification for the deriv procedure to work
; constructors now need to return a list of arbitrary number of terms, not just two
; predicates need to be able to analyze an expression of an arbitrary number of terms, select which is the currently existing highest order operator (**, *, or +), and modify the expression such that that operation with its left and right-hand components is placed in the front of the list before all other operations
; while this is likely theoretically possible, it is probably beyond the scope of what the authors had in mind for this exercise as it requires auxiliary procedures that process the list in addition to those which are the predicates, selectors, and constructors 
