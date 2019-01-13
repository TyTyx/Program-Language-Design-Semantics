#lang racket
(define tear
  (lambda (f x)
    (list (filter f x) (filter (negate f) x))))
