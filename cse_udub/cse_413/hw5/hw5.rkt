;; CSE 413 Programming Languages, Homework 5
;; Yang Zhang
#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct isgreater (e1 e2)  #:transparent) ;; evaluate to 1 if e1>e2 else 0
(struct ifnz (e1 e2 e3)    #:transparent) ;; if e1 is not 0 then e2 else e3
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct munit ()    #:transparent) ;; unit value -- good for ending a list
(struct ismunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs; it is what functions evaluate to
(struct closure (env fun) #:transparent) 

;; Problem 1
; 1(a) racket list -> mupl list
(define racketlist->mupllist 
  (lambda (lst)
    (if (pair? lst) 
      (apair (car lst) (racketlist->mupllist (cdr lst)))
      (munit))))

; 1(a) mupl list -> racket list
(define mupllist->racketlist 
  (lambda (lst)
    (if (apair? lst)
      (if (apair? (apair-e2 lst))  
          (cons (apair-e1 lst) (mupllist->racketlist (apair-e2 lst)))
          (cons (apair-e1 lst)  '()))
      '())))

;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

;; Do NOT change the two cases given to you.  
;; Do add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond [(var? e) 
         (envlookup env (var-string e))]
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))]
        ;; CHANGE add more cases here
        [(int? e) e]
        [(isgreater? e)
         (let ([v1 (eval-under-env (isgreater-e1 e) env)]
               [v2 (eval-under-env (isgreater-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (if (> (int-num v1) (int-num v2))
                   (int 1)
                   (int 0))
               (error "MUPL isgreater applied to non-number")))]
        [(ifnz? e)
         (let ([flag (eval-under-env (ifnz-e1 e) env)])
           (if (int? flag)
               (if (= (int-num flag) 0)
                   (eval-under-env (ifnz-e3 e) env)
                   (eval-under-env (ifnz-e2 e) env))
               (error "MUPL ifnz-e1 applied to non-number")))]
        [(fun? e) (closure env e)]
        
        
        
        [(call? e)
         (let* ([fun-e (if (var? (call-funexp e))
                                 (eval-under-env (call-funexp e) env)
                                      (call-funexp e))]
                [fun-c (eval-under-env fun-e env)]
               [var-v (if (fun? (call-actual e))
                          (call-actual e)
                          (eval-under-env (call-actual e) env))]
               [fname (fun-nameopt (closure-fun fun-c))]
               [vname (fun-formal (closure-fun fun-c))]
               [cbody (fun-body (closure-fun fun-c))])
           (if (closure? fun-c)
               (let* ([new-env (cons (cons fname (closure-fun fun-c)) (cons (cons vname var-v) 
                                     (closure-env fun-c)))]
                     [cur-rst (eval-under-env cbody new-env)])  
                     (if (closure? cur-rst)
                         cur-rst
                         (eval-under-env cur-rst new-env)
                         )
                 )
               (error "not callable")))]
        
        [(mlet? e)
         (if (string? (mlet-var e))
             (let* ([value (if (fun? (mlet-e e))
                               (mlet-e e)
                               (eval-under-env (mlet-e e) env))]
                   [envn (cons (cons (mlet-var e) value) env)])
               (eval-under-env (mlet-body e) envn))
             (error "var must be type of string"))]
           
        [(apair? e) (apair (eval-under-env (apair-e1 e) env) (eval-under-env (apair-e2 e) env))]
        [(fst? e) 
         (let ([pr (eval-under-env (fst-e e) env)])
         (if (apair? pr)
             (apair-e1 pr)
             (error "MUPL fst applied to non-apair" pr)))]
        [(snd? e) 
         (let ([pr (eval-under-env (snd-e e) env)])
         (if (apair? pr)
             (apair-e2 pr)
             (error "MUPL snd applied to non-apair")))]
        [(munit? e) e]
        [(ismunit? e) 
         (if (munit? (eval-under-env (ismunit-e e) env))
             (int 1)
             (int 0))]
        [#t (error (format "bad MUPL expression: ~v" e))]))

;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))
        
;; Problem 3

(define (ifmunit e1 e2 e3) (ifnz (ismunit e1) e2 e3))

(define (mlet* lstlst e2) (if (null? lstlst)
      e2
      (let ([vname (car (car lstlst))]
            [exp (cdr (car lstlst))])
        (mlet vname exp (mlet* (cdr lstlst) e2)))))

(define (ifeq e1 e2 e3 e4) (ifnz (isgreater e1 e2)
                                 e4
                                 (ifnz (isgreater e2 e1)
                                       e4
                                       e3)))

;; Problem 4

(define mupl-map 
  (fun "outer" "method" 
     (fun "apply" "lst"
          (ifnz (ismunit (var "lst"))
                (munit)
                (apair (call (var "method") (fst (var "lst")))
                          (call (call (var "outer") (var "method")) (snd (var "lst"))))
                
                ))))

(define mupl-mapAddN 
 (mlet "map" mupl-map
   (fun "wraper" "n"
        (fun "app" "lst"
            (call 
             (call (var "map") (fun "hala" "x" (add (var "x") (var "n")))) (var "lst"))))))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make grading
;; more difficult, so copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))




















