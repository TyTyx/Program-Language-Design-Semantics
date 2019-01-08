#lang racket

;; January 2018 CS424

(define foo
  (lambda (x)
    (cond ((null? x) x)
          ((pair? (car x)) (append (foo (car x)) (foo (cdr x))))
          (else (append (foo (car x)) (foo (cdr x)))))))
;;(else (append (foo (car x)) (foo (cdr x))))

(define tear
  (lambda (f x)
    (filter f (foo x))))