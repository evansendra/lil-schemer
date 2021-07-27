; Exercise 2.22.  Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:
(define nil '())
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

; If we imagine the original list and the new list as left to right, the original list is
; being iterated left to right while the new list is being built right to left, since the
; first element of the original list ends up being added to the new empty list first, then
; the 2nd element of the list is appended to the front of the new list in 2nd to last position
; the 3rd element in 3rd to last position, and so on
; (1 2 3 4) -> ()
; (1 2 3 4) -> (1)
; (1 2 3 4) -> (4 1)
; (1 2 3 4) -> (9 4 1)
; (1 2 3 4) -> (16 9 4 1)

; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; This doesn't work either. Explain.

; In this version of the program Louis's code is cons'ing the new list of items with another
; item, so the end result will be a list of lists, staring with the empty list and expanding such
; that each new list contains the list before it and the square of the next number in the original list

; (1 2 3 4) -> ()
; (1 2 3 4) -> (() . 1)
; (1 2 3 4) -> ((() . 1) . 4)
; (1 2 3 4) -> (((() . 1) . 4) . 9)
; (1 2 3 4) -> ((((() . 1) . 4) . 9) . 16)