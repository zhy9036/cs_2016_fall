#lang racket
;;; CSE413 HW3 tests
;;; Yang Zhang
(require rackunit "hw3.rkt")

;; test case for sample sum
(write '(diff 'x '(+ x 1 y)))
(newline)
(diff 'x '(+ x 1 y))
(write "check if (+ x 1 y) equals 1")
(newline)
(if (check-equal? (+ 1 0 0) 1)
    'passed
    'failed)
(newline)


;; test cases for sample product
(write '(diff 'x '(* x 5)))
(newline)
(diff 'x '(* x 5))
(write "check if (+ (* x 0) (* 5 1)) equals 5, as x = 2")
(newline)
(if (check-equal? (+ (* 2 0) (* 5 1)) 5)
    'passed
    'failed)


(newline)
(write '(diff 'x '(* x y)))
(newline)
(diff 'x '(* x y))
(write "check if (+ (* x 0) (* y 1)) equals 3, as x = 2 & y = 3")
(newline)
(if (check-equal? (+ (* 2 0) (* 3 1)) 3)
    'passed
    'failed)

;; test cases for sample expt
(newline)
(write '(diff 'x '(expt x 5)))
(newline)
(diff 'x '(expt x 5))
(write "check if (* 1 (* 5 (expt x (- 5 1)))) equals 80, as x = 2")
(newline)
(if (check-equal? (* 1 (* 5 (expt 2 (- 5 1)))) 80)
    'passed
    'failed)

;; test cases for mixed diff
(newline)
(write '(diff 'x '(expt (* 4 x) 6)))
(newline)
(diff 'x '(expt (* 4 x) 6))
(write "check if (* (+ (* 4 1) (* x 0)) (* 6 (expt (* 4 x) (- 6 1)))) equals 786432, as x = 2")
(newline)
(if (check-equal? (* (+ (* 4 1) (* 2 0)) (* 6 (expt (* 4 2) (- 6 1)))) 786432)
    'passed
    'failed)

(newline)
(write '(diff 'x '(+ (* 5 x) (expt (* 4 x) 6))))
(newline)
(diff 'x '(+ (* 5 x) (expt (* 4 x) 6)))
(write "check if (+ (+ (* 5 1) (* x 0)) (* (+ (* 4 1) (* x 0)) (* 6 (expt (* 4 x) (- 6 1))))) equals 786437, as x = 2")
(newline)
(if (check-equal? (+ (+ (* 5 1) (* 2 0)) (* (+ (* 4 1) (* 2 0)) (* 6 (expt (* 4 2) (- 6 1))))) 786437)
    'passed
    'failed)