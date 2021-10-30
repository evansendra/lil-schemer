(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; example usages
(define l (list 1 2 3 4 5))
; (accumulate + 0 l) -> 15
; (accumulate * 1 l) -> 120
; (accumulate cons nil l) -> (1 2 3 4 5)