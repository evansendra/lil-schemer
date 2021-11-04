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

(define (count-leaves-acc t)
  (accumulate + 0 
    (map (lambda (node) (if (pair? node) (count-leaves-acc node) 1)) t))) 