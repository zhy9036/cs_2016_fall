#lang racket
;;CSE 413 HW5 TESTS CASES
;;Yang Zhang
;; MUPL tests - add tests for your code

(require rackunit "hw5.rkt")


(define d (fun "dump" "x" (ifnz (isgreater (var "x") (int 5))
                        (var "x")
                        (call (var "dump") (add (int 1) (var "x"))))))

(define tests
  (test-suite
   "Sample tests for Assignment 5"
   
   ;; simple test case
   (check-equal?
    (eval-exp (add (int 1) (int 2)))
    (int 3)
    "int addition"
    )
   
   ;; test case that uses problems 1, 2, and 4
   (check-equal?
    (mupllist->racketlist
     (eval-exp (call (call mupl-mapAddN (int 7))
                     (racketlist->mupllist 
                      (list (int 3) (int 4) (int 9))))))
    (list (int 10) (int 11) (int 16))
    "mupl-mapAddN - problems 1, 2, 4"
    )
   
   
   ;; test cases for recusive funtion call
   ;; print (int 6) when x < 5 else print (int x)
   ;; 'd' defined above
   (check-equal?
    (eval-under-env (call d (int 0)) '())
    (int 6)
    )
   (check-equal?
    (eval-under-env (call d (int 9)) '())
    (int 9)
    )
   
   ;; test cases p1
    (check-equal?
    (racketlist->mupllist (list (int 3) (int 4)))
    (apair (int 3) (apair (int 4) (munit)))
    )
    
    (check-equal?
    (mupllist->racketlist (apair (int 3) (apair (int 4) (munit))))
    (list (int 3) (int 4))
    )
   
   ;; test cases p2
   (check-equal?
    (eval-exp (isgreater (int 1) (int 2)))
    (int 0)
    )
   
   (check-equal?
    (eval-exp (ifnz (ismunit (int 2)) (int 2) (int 3)))
    (int 3)
    )
   (check-equal?
    (eval-exp (fst (apair (int 2) (int 3))))
    (int 2)
    )
   (check-equal?
    (eval-exp (snd (apair (int 2) (int 3))))
    (int 3)
    )
   
   ;; test cases p3
   (check-equal?
    (eval-exp (ifmunit (munit) (int 1) (int 2)))
    (int 1)
    )
   
   (check-equal?
    (eval-exp (mlet* (list (cons "x" (int 1)) (cons "y" (int 2))) (add (var "y") (var "x"))))
    (int 3)
    )
   
   (check-equal?
    (eval-exp (ifeq (int 1) (int 1) (int 9) (int 2)))
    (int 9)
    )
   ;; test case for p4(1)
   (check-equal?
    (mupllist->racketlist
    (eval-under-env (call (call mupl-map (fun "hala" "x" (add (var "x") (int 1)))) (apair (int 2) (apair (int 3) (munit)))) '())
    )
    (list (int 3) (int 4))
    )
   
   ;; test case for p4(2)
   (check-equal?
    (mupllist->racketlist
    (eval-under-env (call (call mupl-mapAddN (int 5)) (apair (int 0) (apair (int 1) (apair (int 2) (munit))))) '())
    )
    (list (int 5) (int 6) (int 7))
    )
   
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)