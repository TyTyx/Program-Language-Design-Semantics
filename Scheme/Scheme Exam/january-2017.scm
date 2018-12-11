(define flatten
  (lambda (x)
    (cond ((null? x) x)
          ((pair? (car x)) (append (flatten (car x)) (flatten (cdr x))))
          (else (append (list (car x)) (flatten (cdr x)))))))

(define foo
  (lambda (f x)
    (filter f (flatten x))))