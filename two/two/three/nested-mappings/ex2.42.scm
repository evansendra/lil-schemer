; Exercise 2.42: e “eight-queens puzzle” asks how to place eight queens on a chessboard so that no queen is in check from any other (i.e., no two queens are in the same row, col- umn, or diagonal). One possible solution is shown in Figure 2.8. One way to solve the puzzle is to work across the board, placing a queen in each column. Once we have placed k − 1 queens, we must place the kth queen in a position where it does not check any of the queens already on the board. We can formulate this approach recursively: Assume that we have already generated the sequence of all possible ways to place k − 1 queens in the first k − 1 columns of the board. For each of these ways, generate an extended set of posi- tions by placing a queen in each row of the kth column. Now filter these, keeping only the positions for which the queen in the kth column is safe with respect to the other queens. is produces the sequence of all ways to place k queens in the first k columns. By continuing this process, we will produce not only one solution, but all solutions to the puzzle.
(load "flatmap.scm")

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define empty-board nil)

(define (adjoin-position row col positions)
  (cons (list row col) positions))

; tells whether or not the ``position" is safe given the existing ``positions"
; where position is (list row col) and positions is a list of the same format of list as position
; what makes a position safe is not being one of the following
; ...same row as any of positions
; ...same col as any of positions
; ...same diagonal as any of positions, meaning row1 - row2 = col1 - col2
(define (safe-pos? position positions)
  (display position)
  (display positions)
  (if (null? positions)
      true
      (and (let ((cur-pos (car positions)))
              (and 
                (not (= (car cur-pos) (car position)))
                (not (= (cadr cur-pos) (cadr position))
                (not (= (- (car cur-pos) (car position)) (- (cadr cur-pos) (cadr position))))))) 
          (safe? position (cdr positions)))))

; We implement this solution as a procedure queens, which returns a sequence of all solutions to the problem of plac- ing n queens on an n × n chessboard. queens has an inter- nal procedure queen-cols that returns the sequence of all ways to place queens in the first k columns of the board.

(define (queens board-size) 
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board) 
      (filter 
        (lambda (positions) (safe? k positions)) 
        (flatmap
          (lambda (rest-of-queens) 
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; In this procedure rest-of-queens is a way to place k − 1 queens in the first k − 1 columns, and new-row is a proposed row in which to place the queen for the kth column. Com- plete the program by implementing the representation for sets of board positions, including the procedure adjoin- position, which adjoins a new row-column position to a set of positions, and empty-board, which represents an empty set of positions. You must also write the procedure safe?, which determines for a set of positions, whether the queen in the kth column is safe with respect to the others. (Note that we need only check whether the new queen is safe— the other queens are already guaranteed safe with respect to each other.)



; dummy code for displaying a board, but need to write a contains to do it...maybe not worth it...
; (define (display-board positions board-size)
;   (map (lambda (i) 
;     (map (lambda (j) 
;       (if (contains positions (list i j))
;           (display "Q")
;           (display "-")))
;       (enumerate 1 board-size)
;     (enumerate 1 board-size)))))