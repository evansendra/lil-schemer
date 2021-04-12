; allow user to specify number of coins to be used
; (define (count-change amount n-coins)
;   (cc amount n-coins))

; wrapper procedure which takes the amount to be divided and passes to cc
(define (count-change amount)
  (cc amount 5))

; procedure which takes an amount of money and number of kinds of coins
; then conditionally checks if the amount is already 0 in which case return 1
; if the amount is less than 0 OR the number of kinds of coins is 0 in which case return 0
; otherwise recurses through the function in two directions:
; 1. reduce the kinds of coins by 1
; 2. reduce the amount by the first kind of coin
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

; procedure which accepts a number of kinds-of-coins and returns the value of the
; greatest coin in the set based on an initial, ordered set:
; 1 -> 1
; 2 -> 5
; 3 -> 10
; 4 -> 25
; 5 -> 50
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
