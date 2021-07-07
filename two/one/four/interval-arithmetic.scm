(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval-orig x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Exercise 2.7.  Alyssa's program is incomplete because she has not specified the implementation of the interval abstraction. Here is a definition of the interval constructor:

(define (make-interval a b) (cons a b))

; Define selectors upper-bound and lower-bound to complete the implementation.
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

; Exercise 2.8.  Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.
; Subtracting two intervals is an interval whose lower bound is the difference of the two lower bounds and upper bound is the difference of the two upper bounds
(define (sub-interval x y)
	(make-interval (- (lower-bound x) (lower-bound y))
								 (- (upper-bound x) (upper-bound y))))

; alternative version making use of add-interval
(define (sub-interval-alt x y)
	(add-interval x
								(make-interval (- (lower-bound y)) (- (upper-bound y)))))

; Exercise 2.10.  Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa's code to check for this condition and to signal an error if it occurs.
(define (div-interval x y)
  (if (= (upper-bound y) (lower-bound y))
    (error "division by zero interval")
    (mul-interval x 
      (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))
  
