#lang racket

(require rackunit)

(define (* a b)
  (*-iter a b 0))

(define (*-iter a b result)
  (cond ((= b 0) result)
        ((even? b) (*-iter (double a) (halve b) result))
        (else (*-iter a (- b 1) (+ result a)))))

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(check-equal? (* 10 20) 200)
(check-equal? (* 17 91) 1547)