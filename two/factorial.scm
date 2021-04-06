; compute factorial with linear recursive algo
; @param n the number for which factorial is computed
(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

; compute factorial with linear iterative algo
; @param n the number for which factorial is computed
(define (f-iter n)

  ; returns the factorial of n by maintaining an iterative product and counter
  ; @param prod the product at the current step
  ; @param counter the count of the
  (define (itr prod counter)
    (if (> counter n)
      prod
      (itr (* prod counter) (+ counter 1))))

  (itr 1 1)
)
