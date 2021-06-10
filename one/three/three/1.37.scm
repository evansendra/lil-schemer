; Exercise 1.37.  a. An infinite continued fraction is an expression of the form
; f = N1
;     ----------------
;     D1 + N2
;          -----------
;          D2 + N3
;               ------
;               D3 + ...

; As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/phi, where  is the golden ratio (described in section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation -- a so-called k-term finite continued fraction -- has the form

; f = N1
;     ----------------
;     D1 + N2
;          -----------
;          ... + Nk
;               ------
;                Dk 

; Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/phi using

; (cont-frac (lambda (i) 1.0)
          ;  (lambda (i) 1.0)
          ;  k)

; for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?

(define (cont-frac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

; testing

; 1/phi = (/ 1 (/ (+ 1 (sqrt 5)) 2)) = .6180339887498948

; 1/(1+(1/(1+(1/1)))) = 0.6666666667
; 1 ]=> (cont-frac (lambda (i) 1.0)
;                  (lambda (i) 1.0)
;                  3)
;Value: .6666666666666666

; How large must you make k in order to get an approximation that is accurate to 4 decimal places?
; 1 ]=> (cont-frac (lambda (i) 1.0)
;                  (lambda (i) 1.0)
;                  11)
; k = 11

;Value: .6180555555555556

; b. If your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
; initial value of res should be 0
; works by starting from the bottom up
; example of k=3
;        N3      
; r3 <- --------, k = 3, res = 0
;        D3 + res
;        N2      
; r2 <- --------, k = 2, res = r3
;        D2 + res
;        N1      
; r1 <- --------, k = 1, res = r2
;        D1 + res
;    
; r1 is returned, k = 0, res = r1 
;   
(define (cont-frac-iter n d k res)
  (if (= k 0)
      res
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) res)))))

; testing
; 1 ]=> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 3 0)

;Value: .6666666666666666

; 1 ]=> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11 0)

;Value: .6180555555555556

; 1 ]=> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 20 0)

;Value: .6180339850173578