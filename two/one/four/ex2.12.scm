(load "interval-arithmetic.scm")

; After debugging her program, Alyssa shows it to a potential user, who complains that her program solves the wrong problem. He wants a program that can deal with numbers represented as a center value and an additive tolerance; for example, he wants to work with intervals such as 3.5± 0.15 rather than [3.35, 3.65]. Alyssa returns to her desk and fixes this problem by supplying an alternate constructor and alternate selectors:

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; Unfortunately, most of Alyssa's users are engineers. Real engineering situations usually involve measurements with only a small uncertainty, measured as the ratio of the width of the interval to the midpoint of the interval. Engineers usually specify percentage tolerances on the parameters of devices, as in the resistor specifications given earlier.

; Exercise 2.12.  Define a constructor make-center-percent that takes a center and a percentage tolerance and produces the desired interval. You must also define a selector percent that produces the percentage tolerance for a given interval. The center selector is the same as the one shown above.
(define (make-center-percent c p)
  (let ((width (abs (* (/ p 100) c))))
  (make-interval (- c width) (+ c width))))

(load "../../../utils/testing.scm")
; (define (p= x y) (and (= (car x) (car y)) (= (cdr x) (cdr y))))
; (testc (make-center-percent 5.0 10) (make-interval 4.5 5.5) p=)
; (testc (make-center-percent -4.3 7) (make-interval -4.601 -3.999) p=)
; (testc (make-center-percent 0 50) (make-interval 0 0) p=)

(define (percent i)
  (if (= (center i) 0)
    0
    (* 100 (abs (/ (- (upper-bound i) (center i)) (center i))))))
  

; (test (percent (make-center-percent 5.0 10)) 10)
; (test (percent (make-center-percent -4.3 7)) 7)
; (test (percent (make-center-percent 0 50)) 0)