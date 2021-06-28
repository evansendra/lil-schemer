In 1.3 - Formulating Abstractions with Higher-Order Procedures, we do just that.  The chapter starts with passing procedures as arugments to other procedures.  We define some recursively defined calculus functions (e.g. Simpson's rule of integration) using procedures as arguments to build a summation abstraction.

Lambda and let are introduced as tools to define anonymous functions and create local variables.

We define a way to find fixed points of functions passing procedures as arguments, then expand on this with returned procedures in order to re-define average damping & Newton's method as procedures that take and return procedures.  We eventually use fixed-point to calculate some cool stuff like nth-roots.

Also, "first-class" status is defined, which applies to procedures in the case of lisp:

	* They may be named by variables.
	* They may be passed as arguments to procedures.
	* They may be returned as the results of procedures.
	* They may be included in data structures.