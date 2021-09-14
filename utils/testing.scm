; (load "./comparators.scm") ; WEIRD...seems to return current working directory of calling file, not this file...

; allows to compare an actual result to an expected result of a computation optionally passing
; in a custom comparator (= is default) 
(define (testc actual expected comparator)
	(let ((res (comparator expected actual)))
	(display (if res "✅" "🚫"))
	(newline)
	(display "expected: ")
	(display expected)
	(newline)
	(display "actual: ")
	(display actual)
	(newline)
	res))

(define (test actual expected)
	(testc actual expected =))