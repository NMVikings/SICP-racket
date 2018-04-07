#lang racket

(require rackunit)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(check-equal? (gcd 206 40) 2)

; normal order:
(gcd 206 40)

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0) ;executes (remainder 206 40)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40))) 

(if (= (remainder 40 (remainder 206 40)) 0) ;executes (remainder 40 (remainder 206 40))
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ;executes (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))) 0) ;executes (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ;executes (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

2

;'remainder' performed 18 times in normal order


;applicative order:

(gcd 206 40)

(gcd 40 (remainder 206 40))

(gcd 40 6)

(gcd 6 (remainder 40 6))

(gcd 6 4)

(gcd 4 (remainder 6 4))

(gcd 4 2)

(gcd 2 (remainder 4 2))

(gcd 2 0)

2

; 'remainder' performed 4 times