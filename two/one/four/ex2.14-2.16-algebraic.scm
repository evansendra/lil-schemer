; After considerable work, Alyssa P. Hacker delivers her finished system. Several years later, after she has forgotten all about it, she gets a frenzied call from an irate user, Lem E. Tweakit. It seems that Lem has noticed that the formula for parallel resistors can be written in two algebraically equivalent ways:

; R1R2 / (R1 + R2)

; 1 / ((1/R1)+(1/R2))

; He has written the following two programs, each of which computes the parallel-resistors formula differently:

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Lem complains that Alyssa's program gives different answers for the two ways of computing. This is a serious complaint.

; Exercise 2.14.  Demonstrate that Lem is right. Investigate the behavior of the system on a variety of arithmetic expressions. Make some intervals A and B, and use them in computing the expressions A/A and A/B. You will get the most insight by using intervals whose width is a small percentage of the center value. Examine the results of the computation in center-percent form (see exercise 2.12).

; to demonstrate Lem is right, we can show that (not (= (par1 a b) (par2 a b))), for example
; print-interval shortened to pi
(define (pi i)
  (display (center i))
  (display " ± ")
  (display (percent i)))

; 1 ]=> (define r1 (make-center-percent 3 0.1))
;Value: r1
; 1 ]=> (define r2 (make-center-percent 5 0.1))
;Value: r2
; 1 ]=> (define res1 (par1 r1 r2))
;Value: (1.8693824925074929 . 1.8806325075075077)
; 1 ]=> (define res2 (par2 r1 r2))
;Value: (1.8731250000000002 . 1.8768750000000003)

; 1 ]=> (pi res1)
; 1.8750075000075004 ± .29999920000238783
; 1 ]=> (pi res2)
; 1.8750000000000002 ± .10000000000000378

; another example which shows that Lem is right is as follows
; obviously a*(a/a) simplifies to a so the first expression is equivalent to a/b

; 1 ]=> (pi (div-interval (mul-interval a (div-interval a a)) b))
; 2.0016006652667313 ± 3.498850422344508

; 1 ]=> (pi (div-interval a b))
; 2.001000400160064 ± 2.4997500249974944

; We can see that while the center values are relatively similar, the percent values differ quite a lot in each example above
; This is due to the fact that when we compute something like line 46, we are not taking the abstract value a divided by a, multiplying by a and receiving the abstract value a.  Rather, we are taking a's computer-represented value (9.95 . 10.05), multiplying a's upper and lower bounds by the reciprocal of themselves, which tries to find a minimum and maximum based on the cross-computation of the upper and lower bounds of a and a.  So instead of getting the 1 interval (1 . 1), we get (9.95*(1/10.05), 10.05*(1/9.95)).

; Exercise 2.15.  Eva Lu Ator, another user, has also noticed the different intervals computed by different but algebraically equivalent expressions. She says that a formula to compute with intervals using Alyssa's system will produce tighter error bounds if it can be written in such a form that no variable that represents an uncertain number is repeated. Thus, she says, par2 is a ``better'' program for parallel resistances than par1. Is she right? Why?

; She's correct when we use computations that involve multiplication and division.  Addition and subtraction doesn't seem to introduce any additional error, since we don't run into problems adding and subtracting equivalent upper and lower bounds.  However with multiplication and division which is defined in terms of multiplication, we run into problems.

; Why?

; Because each time an equivalent interval expression is multiplied or divided by itself, it introduces more error proportional to the width of the original number.

; Exercise 2.16.  Explain, in general, why equivalent algebraic expressions may lead to different answers. Can you devise an interval-arithmetic package that does not have this shortcoming, or is this task impossible? (Warning: This problem is very difficult.)

; In the world of interval arithmetic, equivalent algebraic expressions may lead to different answers because anytime we multiply or divide using our system, we introduce more uncertainty even if our expressions algebraically simplify to an easy result.  For example, a/a != (1 . 1) because our division uses our multiplication which maximizes and minimizes the bounds of a x 1/a.  The problem boils down to the fact that in arithmetic, division is the inverse of multiplication, so * a / a = 1.  However, in interval arithmetic, we only consider the extrema of the problem, in order to be as generally correct as possible.  When we do something like * a / a in interval arithmetic, the procedure doesn't know that we are multiplying and dividing the SAME value and therefore can disregard the uncertainty created by the computation.

; To devise an interval arithmetic system that doesn't have this shortcoming, we would have to have a way to identify SAME valued intervals throughout a computation and simplify such that the output of (r1r2 / (r1 + r2)) = (1/(1/r1)+(1/r2)).  The system to do this would need to either algebraically simplify expressions that are equivalent or track SAME valued quantities throughout a computation.  However, when something like (r1r2 / (r1 + r2)) is passed in, it's not obvious on first look how we would track such values without them getting distorted in the initial computation.  Building such a system to be general and all-encompassing would be extremely difficult as mentioned by the authors.