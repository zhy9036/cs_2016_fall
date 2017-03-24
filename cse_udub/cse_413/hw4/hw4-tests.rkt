#lang racket
(require rackunit "hw4.rkt")

;; test case for stream red-blue
(red-blue)
(car (red-blue)) ;this line should return 'blue
(cdr (red-blue)) ;this line should return <proc: red>

;; test cases for (take st n)
(take red-blue 0) ;'()
(take red-blue 5) ;'(blue red blue red blue)


;; test cases for (combm n k)
(combm 5 3) ; should return 10
(combm 5 5) ; should return 1
