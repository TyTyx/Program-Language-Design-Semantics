#lang racket
;; Credits to Charlie && Elliot
(define reverse-with-count
  (lambda (f x)
    (cond
      ((null? f) '())
      (else
       (append (make-list (car (reverse x))
                          (car (reverse f)))
               (reverse-with-count (reverse (cdr (reverse f)))
                                 (reverse (cdr (reverse x)))))))))
