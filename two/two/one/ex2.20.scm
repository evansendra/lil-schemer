; Exercise 2.20.  The procedures +, *, and list take arbitrary numbers of arguments. One way to define such procedures is to use define with dotted-tail notation. In a procedure definition, a parameter list that has a dot before the last parameter name indicates that, when the procedure is called, the initial parameters (if any) will have as values the initial arguments, as usual, but the final parameter's value will be a list of any remaining arguments. For instance, given the definition

; (define (f x y . z) <body>)

; the procedure f can be called with two or more arguments. If we evaluate

; (f 1 2 3 4 5 6)

; then in the body of f, x will be 1, y will be 2, and z will be the list (3 4 5 6). Given the definition

; (define (g . w) <body>)

; the procedure g can be called with zero or more arguments. If we evaluate

; (g 1 2 3 4 5 6)

; then in the body of g, w will be the list (1 2 3 4 5 6).11

; Use this notation to write a procedure same-parity that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument. For example,

; (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)

; (same-parity 2 3 4 5 6 7)
; (2 4 6)

; take first integer as the initial argument
; let fip be the parity of the first integer
; let rl be a list to return of all integers with same parity as initial integer
; take 0 or more further integers as list of the arguments
  ; if no more integers in list, return rl
  ; for each integer, if parity = fip, add it to rl
(define (same-parity first . rest)
  (define (same-parity? n m)
    (= (remainder n 2) (remainder m 2)))
  (define (reverse l)
    (define (reverse oldl newl)
      (if (null? oldl)
        newl
        (reverse (cdr oldl) (cons (car oldl) newl))))
    (reverse l ()))
  (define (get-same-parity list rl)
    (cond ((null? list) rl)
          ((same-parity? (car list) first) (get-same-parity (cdr list) (cons (car list) rl)))
          (else (get-same-parity (cdr list) rl))))
  (reverse (get-same-parity rest (list first))))