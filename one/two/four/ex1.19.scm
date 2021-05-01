; Now consider T to be the special case of p = 0 and q = 1 in a family of transformations Tpq, where Tpq transforms the pair (a,b) according to a  bq + aq + ap and b  bp + aq. Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp'q' of the same form, and compute p' and q' in terms of p and q.

; Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp'q' of the same form

; Tpq(0,1) a=1,b=0 => a <- a+b; b<- a => a <- 1; b<- 1
; Tpq(0,1)(Tpq(0,1)) a=1,b=1 => a <- 2; b <- 1

; Tp'q'(0,1) = Tpq(0,1)(Tpq(0,1)) => a = (a+b) ; b = (a) => a <- (a)q + (a+b)q + (a+b)p; b <- (a)p + (a+b)q
; Tp'q'(0,1) a=1, b=0 => a <- 2a+b; b <- a+b => a <- 2; b <- 1

; compute p' and q' in terms of p and q.

; Tpq(a,b) => a <- bq + aq + ap; b <- bp + aq

; Tp'q'(a,b) = Tpq(0,1)(Tpq(0,1)) => a = bq + aq + ap ; b = bp + aq => ...
; ...

; Put this all together to complete the following procedure, which runs in a logarithmic number of steps:

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) 
        (fib-iter a
                  b
                  ; TODO p'
                  ; TODO q'
                  (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; fib numbers to test
; 0, 1, 1, 2, 3, 5, 8, 13, 21, ...