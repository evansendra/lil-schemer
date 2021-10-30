(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

; example usage: outputs (1 2 3 4 5)
; (define t (list 1 (list 2 (list 3 4)) 5))
; (enumerate-tree t)

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))
(sum-odd-squares t) ; 1^2 + 3^2 + 5^2 = 35