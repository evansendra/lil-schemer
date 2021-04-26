; recursive process to implement b^n
; theta(n) steps; theta(n) space
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; recursive procedure / iterative process to implement b^n
; theta(n) steps; theta(1) space
(define (expti b n)
  (expt-iter b 1 n))

(define (expt-iter b product count)
  (if (= count 0)
      product
      (expt-iter b (* product b) (- count 1))))

; successive squaring
; b^n = (b^(n/2))^2 if n is even e.g. 4^2 = (4^1)^2
; b^n = (b^(n-1)) * b if n is odd e.g. 4^1 = 4^0 * 4
; theta(log(n)) steps; theta(log(n)) space
(define (expts b n)
  (cond ((= n 0) 1)
        ((even? n) (square (expts b (/ n 2))))
        (else (* b (expts b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))
