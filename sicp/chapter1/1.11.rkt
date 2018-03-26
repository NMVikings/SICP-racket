#lang racket

(require rackunit)

; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (f (- n 2))
         (f (- n 3)))))

(check-equal? (f 4) 6)
(check-equal? (f 5) 11) 
(check-equal? (f 6) 20)

; iterative process
(define (f-2 n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter (+ a b c) a b (- count 1))))
  (iter 2 1 0 (- n 2)))


(check-equal? (f-2 4) 6)
(check-equal? (f-2 5) 11) 
(check-equal? (f-2 6) 20)