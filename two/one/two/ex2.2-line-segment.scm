; Exercise 2.2.  Consider the problem of representing line segments in a plane. Each segment is represented as a pair of points: a starting point and an ending point. Define a constructor make-segment and selectors start-segment and end-segment that define the representation of segments in terms of points. Furthermore, a point can be represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, specify a constructor make-point and selectors x-point and y-point that define this representation. Finally, using your selectors and constructors, define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints). To try your procedures, you'll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2)
	(cons p1 p2))

(define (start-segment s)
	(car s))

(define (end-segment s)
	(cdr s))

(define (make-point x y)
	(cons x y))

(define (x-point p)
	(car p))

(define (y-point p)
	(cdr p))

(define (midpoint-segment s)
	(define (avg a b) (/ (+ a b) 2.0))
	(let ((p1 (start-segment s))
				(p2 (end-segment s)))
		(make-point (avg (x-point p1) (x-point p2))
								(avg (y-point p1) (y-point p2)))))

; testing
(define (test actual expected comparator)
	(let ((res (comparator expected actual)))
	(display (if res "✅" "🚫"))
	(newline)
	(display "expected: ")
	(display expected)
	(newline)
	(display "actual: ")
	(display actual)
	(newline)
	res))

(define (conseq a b)
	(and (= (car a) (car b)) (= (cdr a) (cdr b))))

; simple testing
(
  let (
		(p12 (make-point 1 2))
		(s1133 (make-segment (make-point 1 1) (make-point 3 3)))
	)
	(test  p12 (cons 1 2) conseq)
	(test (x-point p12) 1 =)
	(test (y-point p12) 2 =)

	; (test s1133 (cons (cons 1 1) (cons 3 3)))
	(test (start-segment s1133) (cons 1 1) conseq)
	(test (end-segment s1133) (cons 3 3) conseq)

	(test (midpoint-segment s1133) (cons 2 2) conseq)
)

; manual test
; 1 ]=> (print-point 
; (midpoint-segment
; (make-segment
; (make-point 0 0)
; (make-point 3 3))))

; (3/2,3/2)