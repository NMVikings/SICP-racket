#lang racket

(require rackunit)

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (square a) (* a a))
      (define (divides? a b)
        (= (remainder b a) 0))
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))
  (= (smallest-divisor n) n))

(check-equal? (prime? 1999) #t)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-process-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (current-process-milliseconds) start-time))
      (display " - not prime")))

(define (report-prime n elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes interval-start interval-end)
  (timed-prime-test interval-start)
  (if (< interval-start interval-end)
      (search-for-primes (+ interval-start 1) interval-end)
      (display "End of searching")))