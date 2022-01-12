; Exercise 2.43: Louis Reasoner is having a terrible time do- ing Exercise 2.42. His queens procedure seems to work, but it runs extremely slowly. (Louis never does manage to wait long enough for it to solve even the 6 × 6 case.) When Louis asks Eva Lu Ator for help, she points out that he has inter- changed the order of the nested mappings in the flatmap, writing it as
(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
      (adjoin-position new-row k rest-of-queens))
              (queen-cols (- k 1))))
        (enumerate-interval 1 board-size))
; Explain why this interchange makes the program run slowly. Estimate how long it will take Louis’s program to solve the eight-queens puzzle, assuming that the program in Exercise 2.42 solves the puzzle in time T .

; In this program, we have swapped the above logic for the original logic:

(flatmap
  (lambda (rest-of-queens) 
    (map (lambda (new-row)
      (adjoin-position new-row k rest-of-queens))
        (enumerate-interval 1 board-size)))
      (queen-cols (- k 1)))

; so the main change is the swap of where the enumeration versus recursive call happens.

; Assume n = board-size...
; k is equal to [1,n]
; In the original variant, the runtime is ~theta(k!*n).  
; k! is the result of the recursively call  of the entire loop each time it runs
; the multiplication by n is the result of the enumerate-interval step which is solely dependent on n
; Since k iterates from [1,n], the resulting runtime is ~theta(n!n) 

; From the prompt, assume T = n!n

; in the new variant of the program, each call to the program enumerates n times
; for each enumeration n, there are k! calls of the same program, but now "the same program" will always make n calls, regardless of the size of k
; each n calls makes n calls, which each make n calls, and so on...
; therefore, there is theta(n^n) runtime in the new program

; Assuming T = n!n and the new program runs in n^n time:
; n^n =     n*n*n*...*n
; T = n!n = n*n*(n-1)*(n-2)*...*1

; n^n / n!n =

; n * n * n * ... * n
; -   -   -         -
; 1   2   3        n-1

; ≈ n * T

; the new program runs n times longer than the original program