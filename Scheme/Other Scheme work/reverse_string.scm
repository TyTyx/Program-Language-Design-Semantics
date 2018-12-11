; Written using Racket v7.0

(define (reverse-string x)
    (list->string (reverse (string-> list x))))

; (reverse-string "What you'd like to reverse ...")
; >"... esrever ot ekil d'uoy tahW"
