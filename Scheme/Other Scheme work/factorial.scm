; Written using Racket v7.0

(define fact
    (lambda (n) 
        (if (= n 0)
        1                       ; base case
        (* n (fact (- n 1)))))) ; inductive case

; > (fact 1)
; 1
; > (fact 0)
; 1
; > (fact 10)
; 3628800
; > (fact 30)
; 265252859812191058636308480000000