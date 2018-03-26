#lang racket

(require rackunit)

; utils
(define (average x y)
  (/ (+ x y) 2))

(check-equal? (average 10.0 -5) 2.5)

(define (improve guess x)
  (average guess (/ x guess)))

(check-equal? (improve 10.0 18) 5.9)

(define (square x) (* x x))

(check-equal? (square 15) 225)
;utils


(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(define (better-good-enough? guess x)
  (< (abs (- 1 (/ guess (improve guess x)))) 0.001))

(check-equal? (better-good-enough? 4.000000636692939 16) #t)


(define (new-sqrt-iter guess x)
  (if (better-good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x)
                 x)))

(define ex1 (new-sqrt 1.6e50))
(define ex2 (new-sqrt 1.6e-09))
(check-equal? (square ex1) 1.6000311355146923e+50)
(check-equal? (square ex2) 1.6001787707763707e-09)