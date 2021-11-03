; Exercise 2.35: Redefine count-leaves from Section 2.2.2
; as an accumulation:
; (define (count-leaves t)
; (accumulate ⟨??⟩ ⟨??⟩ (map ⟨??⟩ ⟨??⟩)))

(load "accumulate.scm")

; from 2.2.2
(define (count-leaves x)
  (cond ((null? x) 0)  
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (count-leaves t)
  (accumulate (lambda (first rest) (+ 1 rest)) 0 
    (map (lambda (node) (if (pair? node) (count-leaves node) node)) t))) 

; problem to be solved:

; 5 error> (define l (list 1 2 3 (list 4 5) (list 6 7) (list 8 (list 9))))

; ;Value: l

; 5 error> l

; ;Value: (1 2 3 (4 5) (6 7) (8 (9)))

; 5 error> (count-leaves l)

; ;Value: 6

; 5 error> (load "../two/count-leaves.scm")

; ;Loading "../two/count-leaves.scm"... done
; ;Value: count-leaves

; 5 error> (count-leaves l)

; ;Value: 9