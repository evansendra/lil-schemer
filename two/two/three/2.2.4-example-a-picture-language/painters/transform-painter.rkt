#lang racket
(require sicp-pict)
;(require "../frames/ex2.46.rkt")

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (vector-sub (m corner1) new-origin)
                  (vector-sub (m corner2) new-origin)))))))

; flipping an image vertically using ``transform-painter``
(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0) ; new origin
                     (make-vect 1.0 1.0) ; new end of edge1
                     (make-vect 0.0 0.0))); new end of edge2

; shrink image to upper-right quarter of frame
(define (shrink-to-upper-right painter)
  (transform-painter
   painter
   (make-vect 0.5 0.5)
   (make-vect 1.0 0.5)
   (make-vect 0.5 1.0)))