(define nil '())

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
 
; example usage
(define (odd? x)
  (define (even? y)
    (= (remainder y 2) 0))
  (not (even? x)))
(filter odd? (list 1 2 3 4 5))