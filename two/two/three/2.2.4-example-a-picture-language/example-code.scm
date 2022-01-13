#lang racket
(require sicp-pict)
; src: https://docs.racket-lang.org/sicp-manual/SICP_Picture_Language.html


(define e einstein)
(define b (bitmap->painter "buddha.jpg"))

; code modified for racket
(define wave2 (beside b (flip-vert b)))
(define wave4 (below wave2 wave2))
; example usage
; (paint wave4)

; original code
;(define wave2 (beside wave (flip-vert wave))) 
;(define wave4 (below wave2 wave2))
