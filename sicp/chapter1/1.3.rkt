#lang racket

(require rackunit)

(define (square a) (* a a))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (func a b c)
  (cond ((and (>= b c)
              (>= a c))
         (sum_of_squares a b))
        ((and (> c b)
              (> a b))
         (sum_of_squares a c))
        (else (sum_of_squares b c))))

(check-equal? (square 10) 100 "square")
(check-equal? (sum_of_squares 2 4) 20 "sum_of_squares")
(check-equal? (func 3 4 5) 41 "2 and 3 number")
(check-equal? (func 5 4 3) 41 "1 and 2 number")
(check-equal? (func 5 3 4) 41 "1 and 3 number")