#lang racket
(define tear
  (lambda (f x)
    (list (filter f x) (not (filter f x)))))

;; TODO: Place the other elements that don't meet the cond into a list. Currrently returns '#f' instead of elements themselves.
