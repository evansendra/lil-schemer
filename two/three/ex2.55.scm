; Exercise 2.55: Eva Lu Ator types to the interpreter the ex- pression

(car ''abracadabra)

; To her surprise, the interpreter prints back quote. Explain.

; we know '... yields (quote ...) but under the hood quote must behave differently than a regular procedure.  This behaves like a list when exposed directly to the interpreter, which is a bit odd (given what we'be read so far).  So instead of showing an error that car can't be used because an incorrect type is passed in to car, we get simply "quote" returned back, showing that 'abracadabra exposed to `car` yields simply quote as cadr would yield abracadabra.