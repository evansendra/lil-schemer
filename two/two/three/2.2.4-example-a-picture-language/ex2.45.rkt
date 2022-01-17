#lang racket
(require sicp-pict)
(include "example-code.rkt")

(define (split op1 op2)
  (define (split-n painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-n painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  split-n)


;Exercise 2.45: right-split and up-split can be expressed as instances of a general splitting operation.
;Define a pro- cedure split with the property that evaluating
(define right-split-2 (split beside below))
(define up-split-2 (split below beside))
;produces procedures right-split and up-split with the same behaviors as the ones already defined.