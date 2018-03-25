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

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(check-equal? (good-enough? 4.000000636692939 16) #t)
(check-equal? (good-enough? 9.6 81) #f)


(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))


(check-equal? (sqrt 16) 4.000000636692939)


(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x)
                 x)))

;(new-sqrt 89)

#|
New-if не будет работать, потому что в racket все тот же аппликативный порядок вычисления. Сначала нужно посчитать
все аргументы, а потом только применять к ним функцию. А new-sqrt-iter передает в new-if рекурсивную функцию. Из-за
чего он никогда не сможет посчитать один из аргументов и зациклиться.
|#
