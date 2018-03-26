#lang racket

(require rackunit)

(define (inc x) (+ x 1))
(check-equal? (inc 5) 6)

(define (dec x) (- x 1))
(check-equal? (dec 3) 2)

(define (recursive-plus a b)
  (if (= a 0)
      b
      (inc (recursive-plus (dec a) b))))
(check-equal? (recursive-plus 5 6) 11)

#|
(recursive-plus 5 6)
(inc (recursive-plus 4 6))
(inc (inc (recursive-plus 3 6)))
(inc (inc (inc (recursive-plus 2 6))))
(inc (inc (inc (inc (recursive-plus 1 6)))))
(inc (inc (inc (inc (inc (recursive-plus 0 6))))))
(inc (inc (inc (inc (inc 6)))))
(inc (inc (inc (inc 7))))
(inc (inc (inc 8)))
(inc (inc 9))
(inc 10)
11
|#

(define (iterative-plus a b)
  (if (= a 0)
      b
      (iterative-plus (dec a) (inc b))))
(check-equal? (iterative-plus 5 6) 11)


#|
(iterative-plus 5 6)
(iterative-plus 4 7)
(iterative-plus 3 8)
(iterative-plus 2 9)
(iterative-plus 1 10)
(iterative-plus 0 11)
11
|#