(define nil '())

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(define l (list 1 (list 2 (list 3 4) 5) (list 6 7)))

; (scale-tree l 10)

; with map
; Another way to implement scale-tree is to regard the tree as a sequence of sub-trees and use map. We map over the sequence, scaling each sub-tree in turn, and return the list of results. In the base case, where the tree is a leaf, we simply multiply by the factor:
(define (scale-tree-map tree factor)
  (map (lambda (subtree) 
        (if (pair? subtree) 
          (scale-tree-map subtree factor) 
          (* factor subtree)))
      tree))

; (scale-tree-map l 10)