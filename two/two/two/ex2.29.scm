; Exercise 2.29.  A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; a.  Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (is-mobile? structure)
  (list? structure))

; b.  Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
; look at the current mobile
; look at the left branch
  ; if left branch has a branch-structure which is a number, add to the total weight
  ; else recurse through the left branch as its own mobile
; look at the right branch
  ; if the right branch has a branch-structure which is a number, add to the total weight
  ; else recurse through the right branch as its own mobile
; return the total weight 


(define (total-weight mobile)
  ; (define (total-weight-branch branch)
  ;   (display (branch-structure branch))
  ;   (let ((structure (branch-structure branch)))
  ;   (if (is-mobile? structure) (total-weight structure) structure)))
      (define (branch-weight branch-structure)
        (if (is-mobile? branch-structure) 
          (total-weight branch-structure)
          branch-structure)) 
      (+ 
        (branch-weight (branch-structure (left-branch mobile)))
        (branch-weight (branch-structure (right-branch mobile)))))

; testing...
(define branch2 (make-branch 2 2))
(define branch-branch (make-branch 3 (make-mobile branch2 branch2)))
(define mobile-simple (make-mobile branch2 branch2))
(define mobile-complex (make-mobile branch2 branch-branch))
; (total-weight mobile-simple)
;Value: 4
; (total-weight mobile-complex)
;Value: 6

; c.  A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.
(define (balanced? mobile)
  (define (torque branch weight)
    (* (branch-length branch) weight))
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
  (and (if (is-mobile? (branch-structure lb)) (balanced? (branch-structure lb)))
       (if (is-mobile? (branch-structure rb)) (balanced? (branch-structure rb)))
       (= (torque lb (if (is-mobile? (branch-structure lb)) (total-weight (branch-structure lb)) (branch-structure lb)))
          (torque rb (if (is-mobile? (branch-structure rb)) (total-weight (branch-structure rb)) (branch-structure rb)))))))

; (balanced? mobile-simple)
; Value: true
; (balanced? mobile-complex)
; Value: false
; (balanced? (make-mobile (make-branch 3 mobile-simple) (make-branch 3 mobile-simple)))
; Value: true

; https://witeboard.com/aa8dff90-06b6-11ec-aa26-999ccd347143

; d.  Suppose we change the representation of mobiles so that the constructors are

; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; How much do you need to change your programs to convert to the new representation?

; We just need to redefine the selectors of mobiles and branches such that they return the appropriate components of the pair
; We can do this keeping (car ...) as is in selectors and replacing (car (cdr ...)) with (cdr ...)
; Finally in (is-mobile? ...) we can replace (list? ...) with (pair? ...)