#lang racket

(require rackunit)

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(check-equal? (* 10 20) 200)
(check-equal? (* 17 91) 1547)