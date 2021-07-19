; Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

; if l1 is empty, return l2
  ; take the car of l1, cons onto l2
  ; make l1 the cdr of l1
  ; run again

(define (reverse l)
  (define (iter l1 l2)
    (if (null? l1)
      l2
      (iter (cdr l1) (cons (car l1) l2))))
  (iter l ()))