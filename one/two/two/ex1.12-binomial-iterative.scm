; tail recursive impelemntation based on the binomial theorem
; in this implementation r is the row of the triangle
; c is the column of the triangle
; both are zero based
(define (p r c)
  (define (factorial n product)
    (if (< n 2)
      product
      (factorial (- n 1) (* product n))
    )
  )

  (define (f a)
    (factorial a 1)
  )

  (/ (f r) (* (f c) (f (- r c))))
)
