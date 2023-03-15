(load "unordered.scm")

; Exercise 2.59.  Implement the union-set operation for the unordered-list representation of sets.

; possible approaches:
; A
; looking at the elements of set1, add them
; looking at the elements of set2, if they are not (element-of-set? set1), add them
(define (union-set set1 set2)
    ; if both set1 and set2 are null, return the null set
    (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set2) set1)
            (union-set set1 (cdr set2)))
        (else (union-set (adjoin-set (car set2) set1) (cdr set2)))))

; B
; add all elements of set1 to the set
; add all elements of set2 to the set
; remove elements that appear more than once

(load "../../../utils/testing.scm")

; TODO: implement comparator that checks if two sets are equal order independent
(test (union-set '(1 2 3) '(3 4 5)) '(5 4 1 2 3))