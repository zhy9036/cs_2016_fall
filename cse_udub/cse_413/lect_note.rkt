#lang racket
(define addxtolst 
  (lambda (n)                    
    (lambda (lst)         
      (map (lambda (x) (+ x n)) lst))))

(define filterinrange
  (lambda (lo hi)
    (lambda (lst) (filter (lambda (n) (and (>= n lo) (<= n hi))) lst))))

(define cmap
  (lambda (f)
    (lambda (lst) (map f lst))))

(define numbers
  (cmap number?))