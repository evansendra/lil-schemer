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