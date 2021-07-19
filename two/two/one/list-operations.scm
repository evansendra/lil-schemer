(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

; (list-ref squares 3)
; 16

; space used is linear, O(N)
; steps taken is linear, O(N)
(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))
(define odds (list 1 3 5 7))

; (length odds)
; 4

; length defined iteratively...
; space used is constant amount, O(1)
; steps taken is linear, O(N)
(define (ilength items)
  (define (length-iter a count)
    (if (null? a)
      count
      (length-iter (cdr a) (+ count 1))))
  (length-iter items 0))

; appends two lists together A and B such that (define append (list a1 a2 a3) (list b1 b2 b3)) produces (a1 a2 a3 b1 b2 b3)
(define (append l1 l2)
  (if (null? l1)
    l2 
    (cons (car l1) (append (cdr l1) l2))))