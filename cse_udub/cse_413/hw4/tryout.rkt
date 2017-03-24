#lang racket
(define combm 
  (letrec([memo '()]
          (f (lambda (n k)          
          (begin
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
               (cdr (assoc k memo)))
               ))) f))
           