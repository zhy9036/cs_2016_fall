#lang racket
;;; CSE 413 HW 1
;;; Yang Zhang

;;; Problem 1 Combnation 
(define fact (lambda (n) 
               (if (< n 2)
                   1
                   (* n (fact (- n 1))))))
(define comb (lambda (n k)
               (/ (fact n) (* (fact k) (fact (- n k))))))


;;; Problem 2 Zip
(define zip (lambda (a b)       
    (if (and (not (null? a)) (not (null? b))) (cons (car a) (zip b (cdr a))) 
                        (if (not (null? b)) (cons (car b) (zip (cdr b) a))
                        (if (not (null? a)) (cons (car a) (zip (cdr a) b)) '())))))


;;; Problem 3 Unzip
(define unziphelper (lambda (odd even a)
                      (if (null? a) 
                          (list odd even)
                          (if (> (length a) 1)
                              (unziphelper (append odd (list (car a))) (append even (list (cadr a))) (cddr a))
                              (unziphelper (append odd (list (car a))) even (cdr a)))
                          )))

(define unzip (lambda (a)
               (unziphelper '() '() a)))


;;; Problem 4 Expand
(define foo (lambda (a b)
              (if (null? b) 
                  a
                  (if (pair? (car b)) (foo (append a (list (cadr (car b)))) 
                                           (if (> (car (car b)) 1) 
                                               (cons
                                                (list (- (car (car b)) 1) (cadr (car b)))
                                                (cdr b))
                                               (cdr b)))
                  (foo (append a (list (car b))) (cdr b))
                  ))))
(define expand (lambda (a) (foo '() a)))


;;; Problem 5
;; a) value, left, right
(define value (lambda (node) (if (null? node) '() (car node))))

(define left (lambda (node) (cadr node)))

(define right (lambda (node) (caddr node)))

;; b) Size of the tree (the number of nodes (not null))
(define size (lambda (root) 
                  (if (null? root) 
                      0
                      (+ 1 (size (right root)) (size (left root))))))

;; c) Contains 
(define contains (lambda (item root) 
                   (if (null? root) 
                       #f
                       (if (equal? item (value root))
                           #t
                           (or (contains item (left root)) (contains item (right root)))))))

;; d) Leaves
(define isleaf (lambda (node) 
                  (if (and (not (null? node)) (null? (left node)) (null? (right node))) 
                      #t
                      #f)))

(define dum (lambda (a node) 
              (if (isleaf node) 
                  (list (value node)) 
                  (if (not (null? node))
                           (flatten (append (dum a (left node)) (append (dum a (right node)) a))) 
                           '()))))
(define (leaves tree) (dum '() tree))

;; e) isBST (+inf.0 is infinity -inf.0 is neg_infinity)
(define (isbstsub tree min max) 
  (if (null? tree)
      #t
      (if (or (< (value tree) min) (> (value tree) max))
          #f
          (and (isbstsub (left tree) min (- (value tree) 1))
               (isbstsub (right tree) (+ 1 (value tree)) max)))))

(define isbst (lambda (tree) 
                (isbstsub tree -inf.0 +inf.0)))