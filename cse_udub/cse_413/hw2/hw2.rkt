#lang racket
;;; CSE 413 HW2
;;; Yang Zhang

 ;; *** PART II ***

 ;; p1 length
  ; ver 1 
  (define lengtht (lambda (lst) 
                    (lenfoo lst 0)))                                                             
  (define lenfoo (lambda (a cur) 
                 (if (null? a)
                     cur
                     (lenfoo (cdr a) (+ 1 cur)))))

  ; ver 2 length of nested lists 
  (define lengtht2 (lambda (lst) (lenfoo2 lst 0)))
  (define lenfoo2 (lambda (a cur)
                 (if (null? a)
                     cur
                     (if (and (not (pair? (car a))) (not (null? (car a))))
                         (lenfoo2 (cdr a) (+ 1 cur))
                         (lenfoo2 (car a) (lenfoo2 (cdr a) cur))))))

 ;; p2 polynomial of a list of coefficients
  (define poly (lambda (x coeff)
                 (polyfoo 0 x 1 coeff)))
  (define polyfoo (lambda(result x cur coeff)
                    (if (null? coeff)
                        result
                        (polyfoo (+ result (* cur (car coeff))) x (* x cur) (cdr coeff)))))

 ;; p3 apply-all
   (define (square x) (* x x))
   (define (cube x) (* x (square x)))
   (define apply-all (lambda (funcs x) (appfoo '() funcs x)))
   (define appfoo (lambda (result funcs x)
                    (if (null? funcs)
                        result
                        (appfoo (append result (list ((car funcs) x))) (cdr funcs) x))))
 
 ;; p4 all-are
   (define all-are (lambda (test) 
                     (lambda (lst)
                       (if (null? lst)
                           #t
                           (if (test (car lst))
                               ((all-are test) (cdr lst))
                               #f)))))

 ;; *** PART III ***
  ; (1) make-expr operator left-op right-op 
   (define make-expr (lambda (lo op ro) (list lo op ro)))
   (define operator (lambda (node) (cadr node)))
   (define left-op (lambda (node) (car node)))
   (define right-op (lambda (node) (caddr node)))
  
  ; (2) preorder inorder postorder
  ; preorder {root left-sub right-sub}
   (define preorder (lambda (tree)
                    (if (null? tree)
                        '()
                        (if (pair? tree)
                        (append (list (operator tree)) 
                                (preorder (left-op tree))
                                (preorder (right-op tree)))
                        (list tree)))))

  ; inorder {left-sub root right-sub}
   (define inorder (lambda (tree)
                    (if (null? tree)
                        '()
                        (if (pair? tree)
                        (append (inorder (left-op tree))
                                (list (operator tree))
                                (inorder (right-op tree)))
                        (list tree)))))

  ; postorder {left-sub right-sub root}
   (define postorder (lambda (tree)
                    (if (null? tree)
                        '()
                        (if (pair? tree)
                        (append (postorder (left-op tree))
                                (postorder (right-op tree))
                                (list (operator tree)))
                        (list tree)))))
  
  ; (3) eval-tree
   (define eval-tree (lambda (tree)
                       (if (pair? tree) (let ((op (cond
                                   ((equal? (operator tree) '+) +)
                                   ((equal? (operator tree) '-) -)
                                   ((equal? (operator tree) '*) *)
                                   ((equal? (operator tree) '/) /)))
                             )
                         (op (eval-tree (left-op tree)) (eval-tree (right-op tree))))
                          tree)))
  ; (4) map-leaves 
   (define map-leaves (lambda (func tree)
                        (if (pair? tree)
                            (make-expr (map-leaves func (left-op tree)) (operator tree) (map-leaves func (right-op tree)))
                            (func tree))))