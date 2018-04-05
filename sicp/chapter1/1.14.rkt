#lang racket

(require rackunit)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(check-equal? (count-change 100) 292)


(define count_change_11 (count-change 11))

(define cc_11 (cc 11 5))

(define first_iteration (+
                         (cc 11 4)
                         (cc -39 5)))

(define second_iteration (+ (+ (cc 11 3)
                              (cc -14 4))
                           0))

(define third_iteration (+ (+ (+ (cc 11 2)
                                 (cc 1 2))
                              0)
                           0))

(define fourth_iteration (+ (+ (+ (+ (cc 11 1)
                                     (cc 6 2))
                                  (+
                                   (cc 1 1)
                                   (cc -4 2)))
                               0)
                            0))

(define fifth_iteration (+ (+ (+ (+ (+ (cc 11 0)
                                       (cc 10 1))
                                    (+ (cc 6 1)
                                       (cc 1 2)))
                                 (+ (+ (cc 1 0)
                                       (cc 0 1))
                                    0))
                              0)
                           0))

(define sixth_iteration (+ (+ (+ (+ (+ 0
                                       (+ (cc 10 0)
                                          (cc 9 1)))
                                    (+ (+ (cc 6 0)
                                          (cc 5 1))
                                       (+ (cc 1 1)
                                          (cc -4 2))))
                                 (+ (+ 0
                                       1)
                                    0))
                              0)
                           0))

(define seventh_iteration (+ (+ (+ (+ (+ 0
                                         (+ 0
                                            (+ (cc 9 0)
                                               (cc 8 1))))) #| 1 |#
                                   (+ (+ 0
                                         (+ 0
                                            (+ (cc 4 0)
                                               (cc 3 1)))  #| 1 |#
                                         (+ (+ (cc 1 0)
                                               (cc 0 1))  #| 1 |#
                                            0)))
                                   (+ (+ 0 1)  #| 1 |#
                                      0))
                                0)
                             0))  #| 4 |#

(check-equal? cc_11 count_change_11)
(check-equal? first_iteration count_change_11)
(check-equal? second_iteration count_change_11)
(check-equal? third_iteration count_change_11)
(check-equal? fourth_iteration count_change_11)
(check-equal? fifth_iteration count_change_11)
(check-equal? sixth_iteration count_change_11)
(check-equal? seventh_iteration count_change_11)