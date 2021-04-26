; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product a bn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)


; successive squaring
; b^n = (b^(n/2))^2 if n is even e.g. 4^2 = (4^1)^2
; b^n = (b^(n-1)) * b if n is odd e.g. 4^1 = 4^0 * 4
; theta(log(n)) steps; theta(log(n)) space
; (define (expts b n)
;   (cond ((= n 0) 1)
;         ((even? n) (square (expts b (/ n 2))))
;         (else (* b (expts b (- n 1))))))
;
; (define (even? n)
;   (= (remainder n 2) 0))
(define (expt b n)
  (exptsi 1 b n))

; original solution - don't modify b
; a * b^n remains unchanged from state to state
; theta(n) steps; theta(1) space
(define (exptsi a b n)
  (cond ((< n 2) a)
        ((even? n) (exptsi (* a b b) b (/ n 2)))
        (else (exptsi (* a b) b (- n 1)))))

; alt solution - modify a and b
; a * b^n remains unchanged from state to state
; theta(n) steps; theta(1) space
(define (exptsi2 a b n)
  (cond ((= n 0) a)
        ((even? n) (exptsi2 a (square b) (/ n 2)))
        (else (exptsi2 (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))
