#lang racket

(require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 10 5) 15)
(check-equal? (a-plus-abs-b 10 -5) 15)
(check-equal? (a-plus-abs-b -10 -5) -5)