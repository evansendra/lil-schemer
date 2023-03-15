; One way to represent a set is as a list of its elements in which no element appears more than once. The empty set is represented by the empty list. In this representation, element-of-set? is similar to the procedure memq of section 2.3.1. It uses equal? instead of eq? so that the set elements need not be symbols:

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; Using this, we can write adjoin-set. If the object to be adjoined is already in the set, we just return the set. Otherwise, we use cons to add the object to the list that represents the set:

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

; For intersection-set we can use a recursive strategy. If we know how to form the intersection of set2 and the cdr of set1, we only need to decide whether to include the car of set1 in this. But this depends on whether (car set1) is also in set2. Here is the resulting procedure:

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))