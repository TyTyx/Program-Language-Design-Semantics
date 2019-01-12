;; hw-scheme

;; Polynomial -> p(x) = a[0] + a[1]*x + a[2]*x^2 + ... + a[n]*x^n
;; List of coefficients -> (a[0] a[1] ... a[n])

;; Note: The constatn coefficients come first. [Just numbers].

;; Define poly-eval, where, (poly-eval p x) evaluates the polynomial @ point x.
;; Example:
;; (poly-eval '(1 2 3) 100) => 30201
;; (poly-eval '() 7) => 7

;; Credits:
;; https://rosettacode.org/wiki/Horner%27s_rule_for_polynomial_evaluation#Racket
;; https://github.com/jdan/code/blob/master/racket/polynomial.rkt
;; MrShedford

Welcome to Racket v7.0.

(define (poly-eval l x)
  (foldr
   (lambda (a b)
     (+ a (* b x))) 0 l))
  
  (define poly-add
    (lambda (p1 p2)
      (cond
        ((null? p1) p2)
        ((null? p2) p1)
        (else
         (cons (+ (car p1) (car p2))
               (poly-add (cdr p1) (cdr p2)))))))
  
  (define poly-mul
    (lambda (p1 p2)
      (if (null? p2)
          '(0)
          (poly-add (scalar p1 (car p2))
               (poly-mul (up-degree p1 1) (cdr p2))))))
  
  (define scalar
    (lambda (poly d)
      (if (null? poly)
          '()
          (cons (* d (car poly)) (scalar (cdr poly) d)))))
  
  (define up-degree
    (lambda (poly n)
      (append (zeros n) poly)))
  
  (define zeros
    (lambda (n)
      (if (< n 1)
          '()
          (cons 0 (zeros (- n 1))))))
  
  (define poly-diff 
  (lambda (p)
      (cond
          ((null? p) '())
          ((= (length p) 1) '())
          (else
              (diff-mul (cdr p) 1)))))
  
  (define diff-mul
    (lambda (p x)
      (cond
        ((null? p) '())
        (else
         (cons (* (car p) x) (diff-mul (cdr p) (+ x 1)))))))
  
  (define poly-int
    (lambda (p)
      (cond
        ((null? p) '())
        ((= (length p) 1) '())
        (else
         (cons 0 (int-div p 1))))))
  
  (define int-div
    (lambda ( p x)
      (cond
        ((null? p) '())
        (else
         (cons (/ (car p) x) (int-div (cdr p) (+ x 1)))))))
  
  (define grovel-poly-eval
    (lambda (s x)
      (cond
        ((null? s) '())
        (else
         (cond
           ((list? (car s)) (cons (is-poly (car s) x) (grovel-poly-eval (cdr s) x)))
           (else
            (cons (car s) (grovel-poly-eval (cdr s) x))))))))
  
  (define is-poly
    (lambda (s x)
      (cond
        ((equal? (car s) 'poly) (poly-eval (cdr s) x))
        (else
         (cons (car s) (grovel-poly-eval (cdr s) x))))))
