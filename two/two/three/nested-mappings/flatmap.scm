(define nil '())
(load "../accumulate.scm")

; flatmap: creates a list of lists created by applying `map` of <proc> to <seq>, where <proc> produces a list
; <proc> a procedure to map returning a list
; <seq> the sequence on which a procedure is mapped
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))