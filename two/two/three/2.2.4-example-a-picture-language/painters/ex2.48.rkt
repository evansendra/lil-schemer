#lang racket

;Exercise 2.48: A directed line segment in the plane can be represented as a pair of vectors—the vector running from the origin to the start-point of the segment, and the vector running from the origin to the end-point of the segment. Use your vector representation from Exercise 2.46 to de- fine a representation for segments with a constructor make- segment and selectors start-segment and end-segment.

(require "../frames/ex2.46.rkt")

(define (make-segment p1 p2))
(define (start-segment s))
(define (end-segment s))