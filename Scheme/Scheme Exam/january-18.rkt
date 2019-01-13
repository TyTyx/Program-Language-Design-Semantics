#lang racket

;; January 2018 CS424

(define tear
  (lambda (f x)
    (list (filter (f x))))

;; TODO: Place the other elements that don't meet the cond into a list.
