(define (f g)
  (g 2))

; (f square) -> 4
; (f ((lambda (z) (* z (+ z 1)))) -> 6

; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.
; (f f)
; (f 2)
; (2 2)
; we end up with the nonsensical expression where 2 is treated as an argument to 2 as if it were a procedure

; which is what ended up happening when I tried to evaluate it
; 1 ]=> (f f)

;The object 2 is not applicable.