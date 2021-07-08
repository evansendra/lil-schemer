; Exercise 2.11. In passing, Ben also cryptically comments: ``By testing the signs of the endpoints of the intervals, it is possible to break mul-interval into nine cases, only one of which requires more than two multiplications.'' Rewrite this procedure using Ben's suggestion.
; let's think about how the current mul-interval works
; given inputs defined by x (l means lower bound, u means upper bound) and y

; x -> (xl, xu); y -> (yl, yu)

; we currently are looking for the minimum product and maximum product of multiplying any two components of x and y

; xy -> (min(xl*yl, xl*yu, xu*yl, xu*yu), max(xl*yl, xl*yu, xu*yl, xu*yu))

; so the first step of Ben's method is to test the signs of the endpoints
; xu -> neg, 0, pos
; knowing the upper bound can help us determine the sign of the lower bound
; xl -> neg, 0, pos
; yu -> neg, 0, pos
; yl -> neg, 0, pos

; cases

; the problem will boil down to 
; what is the lowest magnitude number I will get when multiplying two numbers together?
; what is the highest magnitude number I will get when multiplying two numbers together?

; xl >= 0 and yl >= 0: (xl*yl, xu*yu) --- all positive
; xu <= 0 and yu <= 0: (xu*yu, xl*yl) --- all negative
; xl >= 0 and yu <= 0: (xu*yl, yu*xl) --- y negative x positive
; yl >= 0 and xu <= 0: (yu*xl, xu*yl) --- x negative y positive
; yl <= 0 and yu >= 0 and xl >= 0: (yl*xu, yu*xu) --- y negative and positive x positive
; yl <= 0 and yu >= 0 and xu <= 0: (xl*yu, xl*yl) --- y negative and positive x negative
; xl <= 0 and xu >= 0 and yl >= 0: (xl*yu, xu*yu) --- x negative and positive y positive
; xl <= 0 and xu >= 0 and yu <= 0: (yl*xu, yl*xl) --- x negative and positive y negative 

; xl <= 0 and xu >= 0 and yl <= 0 and yu >= 0 --- y and x both negative and positive

(define (mul-interval-alt x y) 
  (define mi make-interval)
  (let ((xl (lower-bound x))
        (yl (lower-bound y))
        (xu (upper-bound x))
        (yu (upper-bound y)))
    (cond ((and (>= xl 0) (>= yl 0)) (mi (* xl yl) (* xu yu)))  ; all positive
          ((and (<= xu 0) (<= yu 0)) (mi (* xu yu) (* xl yl)))  ; all negative
          ((and (>= xl 0) (<= yu 0)) (mi (* xu yl) (* yu xl)))  ; y negative x positive
          ((and (>= yl 0) (<= xu 0)) (mi (* yu xl) (* xu yl)))  ; x negative y positive
          ((and (<= yl 0) (>= yu 0) (>= xl 0)) (mi (* yl xu) (* yu xu)))  ; y negative and positive x positive
          ((and (<= yl 0) (>= yu 0) (<= xu 0)) (mi (* xl yu) (* xl yl)))  ; y negative and positive x negative
          ((and (<= xl 0) (>= xu 0) (>= yl 0)) (mi (* xl yu) (* xu yu)))  ; x negative and positive y positive
          ((and (<= xl 0) (>= xu 0) (<= yu 0)) (mi (* yl xu) (* yl xl)))  ; x negative and positive y negative 
          ((and (<= xl 0) (>= xu 0) (<= yu 0)) (mi (* yl xu) (* yl xl)))  ; x negative and positive y negative 
          (else (mi (min (* xl yl) (* xl yu) (* xu yl) (* xu yu)) (max (* xl yl) (* xl yu) (* xu yl) (* xu yu)))) ; x and y both positive and negative
    )))

; to test...
; (load "../../../utils/testing.scm")
; (load "interval-arithmetic.scm")
; (define mi make-interval)
; (define (p= x y) (and (= (car x) (car y)) (= (cdr x) (cdr y))))
; (testc (mul-interval-alt (mi -5 -4) (mi -2 -1)) (mul-interval (mi -5 -4) (mi -2 -1)) p=)
; (testc (mul-interval-alt (mi -5 0) (mi -2 -1)) (mul-interval (mi -5 0) (mi -2 -1)) p=)
; (testc (mul-interval-alt (mi 4 5) (mi 1 2)) (mul-interval (mi 4 5) (mi 1 2)) p=)
; (testc (mul-interval-alt (mi -5 -4) (mi 1 2)) (mul-interval (mi -5 -4) (mi 1 2)) p=)
; (testc (mul-interval-alt (mi 1 2) (mi -5 -4)) (mul-interval (mi 1 2) (mi -5 -4)) p=)
; (testc (mul-interval-alt (mi -1 2) (mi -5 -4)) (mul-interval (mi -1 2) (mi -5 -4)) p=)
; (testc (mul-interval-alt (mi -1 2) (mi 4 5)) (mul-interval (mi -1 2) (mi 4 5)) p=)
; (testc (mul-interval-alt (mi 4 5) (mi -1 2)) (mul-interval (mi 4 5) (mi -1 2)) p=)
; (testc (mul-interval-alt (mi -5 -4) (mi -1 2)) (mul-interval (mi -5 -4) (mi -1 2)) p=)
; (testc (mul-interval-alt (mi -5 4) (mi -1 2)) (mul-interval (mi -5 4) (mi -1 2)) p=)