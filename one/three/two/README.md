## Notes

### lambda

((lambda (x) (+ x 1)) 1) -> 2

scheme calls what I previously knew as "anonymous functions" as lambda expressions.

It's also possible to do something like

(define inc (lambda (x) (+ x 1))) -> (define (inc x) (+ x 1))

### let

(let ((<var1> <exp1>)
      (<var2> <exp2>)
      
      (<varn> <expn>))
   <body>)

which is equivalent to


let	<var1> have the value <exp1> and
<var2> have the value <exp2> and
...
<varn> have the value <expn>
in	<body>

which is alternative syntax for

((lambda (<var1> ...<varn>)
    <body>)
 <exp1>
 
 <expn>)