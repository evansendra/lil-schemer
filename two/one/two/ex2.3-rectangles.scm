(load "ex2.2-line-segment.scm")

; first implementation
; obvious disadvantage here is how explicit one must be to call this constructor
(define (make-rectangle x1 y1 x2 y2 x3 y3 x4 y4)
	(cons (make-segment (make-point x1 y1) (make-point x2 y2))
				(make-segment (make-point x2 y2) (make-point x3 y3))))

(define (rect-length r)
	(let ((length-seg (car r)))
		(- (x-point (end-segment length-seg))
			 (x-point (start-segment length-seg)))))

(define (rect-width r)
	(let ((width-seg (cdr r)))
		(- (y-point (start-segment width-seg))
			 (y-point (end-segment width-seg)))))

(define (area r)
	(* (rect-width r) (rect-length r)))

(define (perimeter r)
	(* 2 (+ (rect-width r) (rect-length r))))

; 1 ]=> (area (make-rectangle 0 3 3 3 3 0 0 0))
;Value: 9

; 1 ]=> (perimeter (make-rectangle 0 3 3 3 3 0 0 0))
;Value: 12