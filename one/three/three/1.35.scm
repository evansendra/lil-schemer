; Exercise 1.35.  Show that the golden ratio  (section 1.2.2) is a fixed point of the transformation x  1 + 1/x, and use this fact to compute  by means of the fixed-point procedure.

; math is in  /tex/math-exercises.pdf under 1.35

; and use this fact to compute  by means of the fixed-point procedure

(load "fixed-point.scm")
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

; Value: 1.6180327868852458