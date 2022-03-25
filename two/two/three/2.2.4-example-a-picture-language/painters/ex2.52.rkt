#lang racket
(require sicp-pict)

(require "../square-limit.rkt")
(require "wave-custom.rkt")
;
;Exercise 2.52: Make changes to the square limit of wave shown in Figure 2.9 by working at each of the levels de- scribed above. In particular:
;xxx a. Add some segments to the primitive wave painter of Exercise 2.49 (to add a smile, for example).
;b. Changethepaernconstructedbycorner-split(for example, by using only one copy of the up-split and right-split images instead of two).
;c. Modifytheversionofsquare-limitthatusessquare- of-four so as to assemble the corners in a different paern. (For example, you might make the big Mr. Rogers look outward from each corner of the square.)

(paint (square-limit wave 1))
; (paint wave)