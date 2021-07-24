; really cool alternative solution I found which makes use of the fact that you can
; cons the car of the list being built with the recursive call to not reverse the list
; at the end
(define (same-parity . l) 
   (define (parity l test) 
     (if (null? l) 
         (list) 
         (if (test (car l)) 
             (cons (car l) (parity (cdr l) test)) 
             (parity (cdr l) test)))) 
    
   (if (even? (car l)) 
       (parity l even?) 
       (parity l odd?))) 