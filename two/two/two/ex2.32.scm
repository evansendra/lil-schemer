; Exercise 2.32.  We can represent a set as a list of distinct elements, and we can represent the set of all subsets of the set as a list of lists. For example, if the set is (1 2 3), then the set of all subsets is (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)). Complete the following definition of a procedure that generates the set of subsets of a set and give a clear explanation of why it works:

(define nil '())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (element) (cons (car s) element)) rest)))))

; why does this work?

; at each step, while taking away the first element of the list
; the first element appended to the subsets of the rest of the list
; reveals the set of all subsets

; visualizing...we imagine that the left side of the arrow recurses until we get to the empty set
; where the appending begins to happen and bubble upwards
; (subsets (1 2 3)) => (() (1) (2) (1 2) (3) (1 3) (2 3) (1 2 3))
; (subsets (2 3)) => (() (2) (3) (2 3))
; (subsets (3)) => (() (3))
; (subsets ()) => ()