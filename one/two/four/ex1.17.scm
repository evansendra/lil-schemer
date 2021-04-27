; adding by means of theta(b) steps
; (define (* a b)
;   (if (= b 0)
;       0
;       (+ a (* a (- b 1)))))

; Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.
; again use b as the driver of decrementing
; if b is 0 a * b = 0
; if b is even a * b = a * 2 * b / 2 = 2 * a * b / 2 = double a * (halve b)
; if b is odd a * b = a + a * b - 1
(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

(define (halve a)
  (/ a 2))

(define (double a)
  (+ a a))
; (* 2 2)
; (double (* 2 (halve 2)))
; (double (* 2 1))
; (double (+ 2 (* 2 0)))
; (double 2)
; 4

; (* 2 3)
; (+ 2 (* 2 2))
; 6
