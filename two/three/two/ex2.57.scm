; Exercise 2.57.  Extend the differentiation program to handle sums and products of arbitrary numbers of (two or more) terms. Then the last example above could be expressed as
(load "../../../utils/testing.scm")
(load "ex2.56.scm")
(print "ex2.57.scm")
; Try to do this by changing only the representation for sums and products, without changing the deriv procedure at all. For example, the addend of a sum would be the first term, and the augend would be the sum of the rest of the terms.

; flattens the list down to two terms using flatten-fn to combine terms
(define (flatten-l list flatten-fn)
  (cond ((< (length list) 3) (flatten-fn (car list) (cadr list)))
        (else (flatten-fn (car list) (flatten-l (cdr list) flatten-fn)))))

(define (make-sum-l l) (flatten-l l make-sum))
(define (make-product-l l) (flatten-l l make-product))

; The addend is the second item of the sum list:
(define (addend s) (cadr s))

; The augend is the third item of the sum list or the sum of the rest of the terms in the list
(define (augend s) (if (= (length s) 3) (caddr s) (make-sum-l (cddr s))))

; A product is a list whose first element is the symbol *:
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

; The multiplier is the second item of the product list:
(define (multiplier p) (cadr p))

; The multiplicand is the third item of the product list:
(define (multiplicand p) (if (= (length p) 3) (caddr p) (make-product-l (cddr p))))

(define expected '(+ (* x y) (* y (+ x 3))))
(test (deriv '(* x y (+ x 3)) 'x) expected)