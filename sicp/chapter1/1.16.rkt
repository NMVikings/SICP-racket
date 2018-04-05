#lang racket

(require rackunit)

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(check-equal? (fast-expt 10 10) 10000000000)
(check-equal? (fast-expt 2 9) 512)
(check-equal? (fast-expt 1891 1) 1891)