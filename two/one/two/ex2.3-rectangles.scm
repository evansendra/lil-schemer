(load "ex2.2-line-segment.scm")

; first implementation
; obvious disadvantage here is how explicit one must be to call this constructor
; (define (make-rectangle x1 y1 x2 y2 x3 y3 x4 y4)
; 	(cons (make-segment (make-point x1 y1) (make-point x2 y2))
; 				(make-segment (make-point x2 y2) (make-point x3 y3))))

; (define (rect-length r)
; 	(let ((length-seg (car r)))
; 		(- (x-point (end-segment length-seg))
; 			 (x-point (start-segment length-seg)))))

; (define (rect-width r)
; 	(let ((width-seg (cdr r)))
; 		(- (y-point (start-segment width-seg))
; 			 (y-point (end-segment width-seg)))))

; second definition
; assumes given two points which are the corners of the rectangles
(define (make-rectangle c1 c2)
	(make-segment c1 c2))

(define (rect-length r)
	(let ((p1 (start-segment r))
				(p2 (end-segment r)))
		(abs (- (x-point p2) (x-point p1)))))

(define (rect-width r)
	(let ((p1 (start-segment r))
				(p2 (end-segment r)))
		(abs (- (y-point p2) (y-point p1)))))

(define (area r)
	(* (rect-width r) (rect-length r)))

(define (perimeter r)
	(* 2 (+ (rect-width r) (rect-length r))))

; testing V1
; 1 ]=> (area (make-rectangle 0 3 3 3 3 0 0 0))
;Value: 9

; 1 ]=> (perimeter (make-rectangle 0 3 3 3 3 0 0 0))
;Value: 12

; testing V2
; 1 ]=> (perimeter (make-rectangle (make-point 3 3) (make-point 0 0)))
;Value: 12

; 1 ]=> (perimeter (make-rectangle (make-point 0 0) (make-point 3 3)))
;Value: 12

; 1 ]=> (area (make-rectangle (make-point 0 0) (make-point 3 3)))
;Value: 9

; 1 ]=> (area (make-rectangle (make-point 3 3) (make-point 0 0)))
;Value: 9