#lang racket
;; Get the k-th element of a list.

;; Accessors.

;; Get the 1st element of pair, or head of list.
(define kons
  (lambda (a d)
    (lambda (b)
      (if b a d))))

;; Get the 2nd element of pair, or tail of list.
(define kar
  (lambda (p)
    (p #t)))

(define kdr
  (lambda (p)
    (p #f)))

(define empty-list #f)

;; Sample 4-element list.
(define l4 (kons 11 (kons 12 (kons 13 (kons 14 empty-list)))))

(define k-th
  (lambda (k l)
    (if (= k 0)
        (kar l)
        (k-th (- k 1) (kdr l)))))

;; Sample Inputs and Outputs:

;; > (k-th 0 l4)
;; 11

;; > (k-th 1 l4)
;; 12

;; > (k-th 2 l4)
;; 13

;; > (k-th 3 l4)
;; 14
