; Exercise 2.42: e “eight-queens puzzle” asks how to place eight queens on a chessboard so that no queen is in check from any other (i.e., no two queens are in the same row, col- umn, or diagonal). One possible solution is shown in Figure 2.8. One way to solve the puzzle is to work across the board, placing a queen in each column. Once we have placed k − 1 queens, we must place the kth queen in a position where it does not check any of the queens already on the board. We can formulate this approach recursively: Assume that we have already generated the sequence of all possible ways to place k − 1 queens in the first k − 1 columns of the board. For each of these ways, generate an extended set of posi- tions by placing a queen in each row of the kth column. Now filter these, keeping only the positions for which the queen in the kth column is safe with respect to the other queens. is produces the sequence of all ways to place k queens in the first k columns. By continuing this process, we will produce not only one solution, but all solutions to the puzzle.
(load "flatmap.scm")

(define nil '())
(define DEBUG false)
(define (debug-newline) (if DEBUG (newline)))
(define (debug-display msg)
  (if DEBUG
      (display msg)))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define empty-board nil)

; adjoins a position in row and column specified by row and col
; to the existing set of positions determined by positions
; row: integer
; col: integer
; positions: list of lists which contain two integers specifying the row
; & col occupied by each position respectively
(define (adjoin-position row col positions)
  (append positions (list (list row col))))

; determines for a set of positions, whether the queen in the k-th column
; is safe with respsect to the others
; how we'll tackle this:
; make one pass through positions determining which position is the k-th column position
; make another pass through the list, determining if this position is safe, defined by
; the position not being in the same row
; the position not being in the same col
; the position not being in the same diagonal (delta of row is the same as delta of col)
(define (safe? column positions)
  (debug-display "column: ")
  (debug-display column)
  (debug-display " positions: ")
  (debug-display positions)
  (debug-newline)
  ; get the k-th item in a list
  ; k the number of item in the list to get
  ; count the count of the iterations through the list, which is always 0 to start
  ; items the list of items
  (define (get-kth-item k count items)
    (debug-display "k: ")
    (debug-display k)
    (debug-display " count: ")
    (debug-display count)
    (debug-display " items: ")
    (debug-display items)
    (debug-newline)
    (if (= (- k 1) count)
        (car items)
        (get-kth-item k (+ count 1) (cdr items))))
  (define (safe-pos? position positions)
    (debug-display "position: ")
    (debug-display position)
    (debug-display "positions: ")
    (debug-display positions)
    (debug-newline)
    (if (null? positions)
        true
        (and (let ((cur-pos (car positions)))
                (debug-display " cur-pos: ")
                (debug-display cur-pos)
                (debug-newline)
                (or (and (= (car cur-pos) (car position)) (= (cadr cur-pos) (cadr position))) ; the position is the same as one in positions
                    (and  ; the position is not...
                      (not (= (car cur-pos) (car position))) ; ...same row
                      (not (= (cadr cur-pos) (cadr position))) ; ... same col
                      (not (= (abs (- (car cur-pos) (car position))) (abs (- (cadr cur-pos) (cadr position)))))))) ; ... same diagonal
            (safe-pos? position (cdr positions)))))
  (safe-pos? (get-kth-item column 0 positions) positions))

; We implement this solution as a procedure queens, which returns a sequence of all solutions to the problem of plac- ing n queens on an n × n chessboard. queens has an inter- nal procedure queen-cols that returns the sequence of all ways to place queens in the first k columns of the board.

(define (queens board-size) 
  (define (queen-cols k)
    (debug-display " queen cols k: ")
    (debug-display k)
    (debug-newline)
    (if (= k 0)
      (list empty-board) 
      (filter 
        (lambda (positions) (debug-display "k: ") (debug-display k) (debug-newline) (debug-display "positions: ") (debug-display positions) (debug-newline) 
          (safe? k positions)) 
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