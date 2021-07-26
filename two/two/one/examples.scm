(define nil '())

; chain of pairs to represent sequence 1 2 3 4
(cons 1
  (cons 2
    (cons 3
      (cons 4 nil))))

; Such a sequence of pairs, formed by nested conses, is called a list, and Scheme provides a primitive called list to help in constructing lists.8 The above sequence could be produced by (list 1 2 3 4). In general,

; (list <a1> <a2> ... <an>)

; is equivalent to

; (cons <a1> (cons <a2> (cons ... (cons <an> nil) ...)))

; e.g.
(define one-through-four (list 1 2 3 4))

; interesting
; (cadr <arg>) means (car (cdr <arg>))
(cadr (cons 1 (cons 2 (cons 3 (cons 4 nil)))))
; eq
(cadr (list 1 2 3 4))
; eq
(car (cdr (list 1 2 3 4)))
; eq
2
; and
; (cdar <arg>) means (cdr (car <arg>))

; ``cons'' can be used to append an item to an existing ``list'''
(cons 0 one-through-four)
; (0 1 2 3 4)

; dotted-tail notation
; For instance, given the definition

(define (f x y . z) <body>)

; the procedure f can be called with two or more arguments. If we evaluate

(f 1 2 3 4 5 6)

; then in the body of f, x will be 1, y will be 2, and z will be the list (3 4 5 6). Given the definition

(define (g . w) <body>)

; the procedure g can be called with zero or more arguments. If we evaluate

(g 1 2 3 4 5 6)

; then in the body of g, w will be the list (1 2 3 4 5 6).

; To define f and g using lambda we would write

(define f (lambda (x y . z) <body>))
(define g (lambda w <body>))

; mapping over lists

(define (scale-list items factor)
  (if (null? items)
    nil 
    (cons (* (car items) factor)
          (scale-list (cdr items) factor))))

; more generally...

(define (map proc list)
  (if (null? list)
      nil 
      (cons (proc (car list))
            (map proc (cdr list)))))

; (scale-list (list 1 2 3 4 5) 10)
; (map (lambda (x) (* x 10)) (list 1 2 3 4 5))

; scale-list in terms of map
(define (scale-list items factor)
  (map (lambda (x) (* x factor))
        items))