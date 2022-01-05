(load "../accumulate.scm")

(define nil '())
(define n 6) ; could be any integer >= 1

; alternative implementation: two/two/three/signal-flow-even-fibs.scm
(define (enumerate-interval low high)
  (define (iter low high seq)
    (if (> low high)
        seq
        (iter (+ low 1) high (append seq (list low)))))
  (iter low high nil))

(accumulate
  append nil (map (lambda (i)
               (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
                  (enumerate-interval 1 n)))


; alternatively using flatmap...
; (load "flatmap.scm")
; (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n))