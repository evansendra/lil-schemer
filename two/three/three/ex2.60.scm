; Exercise 2.60.  We specified that a set would be represented as a list with no duplicates. Now suppose we allow duplicates. For instance, the set {1,2,3} could be represented as the list (2 3 2 1 3 2 2). Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on this representation. 
(load "../../../utils/testing.scm")

(define test-l '(3 2 1 1 2))

(define (element-of-set? x s) 
    (cond ((null? s) false)
        ((equal? x (car s)) true)
        (else (element-of-set? x (cdr s)))))

; (test (element-of-set? 1 test-l) true)
; (test (element-of-set? 0 test-l) false)
; (test (element-of-set? 5 '()) false)

(define adjoin-set cons) 

; (test (adjoin-set 0 test-l) (cons 0 test-l))
; (test (adjoin-set 1 test-l) (cons 1 test-l))
; (test (adjoin-set 1 '()) '(1))

(define (union-set s t) 
    (cond ((null? s) t)
        (else (cons (car s) (union-set (cdr s) t)))))

; (test (union-set '(1 2 3) test-l) (append '(1 2 3) test-l))
; (test (union-set '() test-l) test-l)

(define (intersection-set s t) 
    (define (intersection-set-aux s t seen)
        (cond ((null? s) '())
            ((and (element-of-set? (car s) t) (not (element-of-set? (car s) seen))) 
                (cons (car s) (intersection-set-aux (cdr s) t (cons (car s) seen))))
            (else (intersection-set-aux (cdr s) t seen))))
    (intersection-set-aux s t '()))
    

; (test (intersection-set '(0 1 2 4) test-l) '(1 2))
; (test (intersection-set '(0 5 6) test-l) '())
; (test (intersection-set '() test-l) '())
; (test (intersection-set test-l test-l) '(3 2 1))

; How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation? Are there applications for which you would use this representation in preference to the non-duplicate one?

; element-of-set? same as before
; adjoin-set becomes ϴ(1) instead of ϴ(n) since we don't care if it's an element of the set already and don't need to loop through the set to figure it out
; union-set becomes ϴ(n) instead of ϴ(n^2), as now we don't need to loop through the set each time to figure out if it's a duplicate before cons'ing it with the current list.  We do still need to loop through once though to add all elements to the list.
; intersection-set becomes ϴ(n*n*k) or ϴ(n^2*k), where k is the number of non-duplicate-elements, as we now have to keep track of which elements were seen to avoid duplicating them in the return list, since each list may contain duplicate elements.  In the worst case, no elements are duplicates, so k = n, and the algorithm is O(n^3).  The memory also grows with input of twice n, instead of once n

; In conclusion, the applications for which I'd use this representation in comparison to the non-duplicate one are when:
; all elements of a set must be represented, regardless of uniqueness (e.g. a list containing ages of a group of people)
; or
; there are many calls to adjoin-set or union-set, and memory isn't a concern, since in the worst case you must track many duplicates

; in almost all other cases this is probably a bad idea though