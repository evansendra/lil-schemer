#lang racket
(require sicp-pict)

; (require "../square-limit.rkt")
(require "wave-custom.rkt")
;
;Exercise 2.52: Make changes to the square limit of wave shown in Figure 2.9 by working at each of the levels de- scribed above. In particular:
;xxx a. Add some segments to the primitive wave painter of Exercise 2.49 (to add a smile, for example).
;b. Changethepaernconstructedbycorner-split(for example, by using only one copy of the up-split and right-split images instead of two).
;c. Modifytheversionofsquare-limitthatusessquare- of-four so as to assemble the corners in a different paern. (For example, you might make the big Mr. Rogers look outward from each corner of the square.)

; a is done in `wave-custom.rkt`


; (paint wave)

; b
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter smaller))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
            (below painter smaller))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(paint (square-limit wave 2))