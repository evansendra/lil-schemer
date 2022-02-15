#lang racket
(require sicp-pict)

;Exercise 2.49: Use segments->painter to define the fol- lowing primitive painters:
;a. The painter that draws the outline of the designated frame.
;b. the painterthatdrawsan“X”byconnectingopposite corners of the frame.
;c. The painter that draws a diamond shape by connect- ing the midpoints of the sides of the frame.
;d. The wave painter.

(define outline 
  (segments->painter 
   (list 
    (segment (vect 0.0 0.0) (vect 0.0 1.0)) 
    (segment (vect 0.0 0.0) (vect 1.0 0.0)) 
    (segment (vect 0.0 1.0) (vect 1.0 1.0)) 
    (segment (vect 1.0 0.0) (vect 1.0 1.0)))))
; (paint outline)

 (define x-painter 
   (segments->painter 
    (list 
     (segment (vect 0.0 0.0) (vect 1.0 1.0)) 
     (segment (vect 0.0 1.0) (vect 1.0 0.0)))))
; (paint x-painter)

(define diamond 
  (segments->painter 
   (list 
    (segment (vect 0.0 0.5) (vect 0.5 0.0)) 
    (segment (vect 0.5 0.0) (vect 1.0 0.5)) 
    (segment (vect 1.0 0.5) (vect 0.5 1.0)) 
    (segment (vect 0.5 1.0) (vect 0.0 0.5)))))
; (paint diamond)

;(define (wave))