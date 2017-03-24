#lang racket
;;; CSE 413 HW4 Park II
;;; YANG ZHANG


(provide red-blue take combm)

;; P1 Election year special, a stream
(define red-blue 
    (letrec
        ([blue (lambda ()
               (cons 'blue red))]
         [red (lambda ()
              (cons 'red blue))])
      blue))

;; P2 (take st n)
(define take (lambda (st n)
               (cond
                 ((= n 0) '())
                 (#t (cons (car (st)) (take (cdr (st)) (- n 1))))
                 )))

;; P3 combm (memorized version of comb)
(define combm 
  (letrec([memo '()]
          (f (lambda (n k)          
          (begin
            (set! memo (cons (cons 0 1) memo))
            (letrec ([fact (lambda (n)
                  (let ([ans (assoc n memo)])
                    (if ans
                        memo
                        (let ([new_ans (if (or (= n 1) (= n 0))
                                           1
                                           (* n (cdr (assoc (- n 1) (fact (- n 1))))
                                              ))])
                          (begin
                            (set! memo (cons (cons n new_ans) memo))
                            memo))))
                  )]) (fact n))
               (/ (cdr (assoc n memo)) (* (cdr (assoc k memo)) (cdr (assoc (- n k) memo)))))
               ))) f))