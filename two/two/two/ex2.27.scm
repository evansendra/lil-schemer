; Exercise 2.27.  Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,

(define x (list (list 1 2) (list 3 4)))

; (define (reverse l)
;   (define (iter l1 l2)
;     (if (null? l1)
;       l2
;       (iter (cdr l1) (cons (car l1) l2))))
;   (iter l ()))

(define (deep-reverse l)
  (define (iter l1 l2)
    (cond ((null? l1) l2)
          ((pair? (car l1)) (iter (cdr l1) (cons (deep-reverse (car l1)) l2))) 
          (else (iter (cdr l1) (cons (car l1) l2)))))
    (iter l ()))

; x
; ((1 2) (3 4))

;; (reverse x)
; ((3 4) (1 2))

;; (deep-reverse x)
; ((4 3) (2 1))