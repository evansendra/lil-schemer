;Exercise 2.51: Define the below operation for painters. below takes two painters as arguments. e resulting painter, given
;a frame, draws with the first painter in the boom of the frame and with the second painter in the top. Define below in two different ways—first by writing a procedure that is analogous to the beside procedure given above, and again in terms of beside and suitable rotation operations (from Exercise 2.50).
#lang racket
(require sicp-pict)
(require "./ex2.50.rkt")

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left (transform-painter
                       painter1
                       (make-vect 0.0 0.0)
                       split-point
                       (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.0)
            (make-vect 0.5 1.0))))
      (lambda (frame) (paint-left frame) (paint-right frame)))))

; first way
(define (below p1 p2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-down (transform-painter
                    p1
                    (make-vect 0.0 0.0)
                    (make-vect 1.0 0.0)
                    split-point))
          (paint-up (transform-painter
                       p2
                       split-point
                       (make-vect 1.0 0.5)
                       (make-vect 0.0 1.0))))
      (lambda (frame) (paint-down frame) (paint-up frame)))))

; second way
; what we want is to define in terms of beside in such a way that
; p1 is rotated 270 degrees as first argument of beside; p2 rotated 270 degrees as second arugment of beside
; now we have them horizontally stacked, we just need to rotate the whole thing 90 degrees to get them vertically stacked
(define (below-2 p1 p2)
  (define (rotate90 p) (rotate270 (rotate180 p)))
  (rotate90 (beside (rotate270 p1) (rotate270 p2))))