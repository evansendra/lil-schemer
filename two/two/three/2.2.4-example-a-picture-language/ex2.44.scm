#lang racket
(require sicp-pict)
(require "example-code.scm")

(define (up-split painter n)
  (if (= n 0)
      painter
      (below (beside (up-split (- n 1))))))