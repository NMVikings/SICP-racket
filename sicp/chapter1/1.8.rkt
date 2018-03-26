#lang racket

(require rackunit)

(define (qube x)
  (* x x x))

(check-equal? (qube -5) -125)

(define (good-enough? guess x)
  (< (abs (- (qube guess) x)) 0.001))

(check-equal? (good-enough? 10 1000) #t)
(check-equal? (good-enough? 18 1000) #f)

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(check-equal? (improve 14.0 1000) 11.034013605442176)

(define (qube-sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (qube-sqrt-iter (improve guess x) x)))

(define (qube-sqrt x)
  (qube-sqrt-iter 1.0 x))

(check-equal? (qube-sqrt 27) 3.0000005410641766)
(check-equal? (qube-sqrt -10) -2.1544411110031603)