(define (list= l1 l2) (listc= l1 l2 =))

(define (listc= l1 l2 comparator)
  (cond ((and (null? l1) (null? l2)) true)
    ((or (null? l1) (null? l2)) false)
    (else (if (comparator (car l1) (car l2)) 
              (list= (cdr l1) (cdr l2))
              false))))
