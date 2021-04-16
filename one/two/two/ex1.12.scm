; given r and c (1-based index) values of the row and column of our place in
; Lord Pascal himself's triagnle, compute the value of our place
; @param r the row of the triangle (1-based index)
; @param c the column of the triangle (1-based index)
(define (pascal r c)
  (if (or (= r 1) (= c 1) (= c r))
    1
    (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))

; shorthand for (pascal r c)
(define (p r c) (pascal r c))

; (pascal 4 2 ) -> 3
; (+ (p 3 1) (p 3 2))
; (+ 1 (p 3 2))
; (+ 1 (+ (p 2 1) (p 2 2)))
; (+ 1 (+ 1 1))
; (+ 1 2)
; 3
