#lang racket
;;; CSE413 HW3 DIFFERENTIATION
;;; Yang Zhang
(provide diff)
;;; fragments func
 ;; diff sum, product, expt
   (define diff-sum (lambda(x E)
                      (cons '+ (map (lambda(e) (diff x e)) E))))
   (define diff-product (lambda(x E)
                      (list '+ (list '* (car E) (diff x (cadr E)))
                            (list '* (cadr E) (diff x (car E))))))
   (define diff-expt (lambda(x E)
                     (list '* (diff x (car E)) (list '* (cadr E) (list 'expt (car E) (list '- (cadr E) 1))))))

 ;; dispatch table
   (define diff-dispatch
     (list (list '+ diff-sum)
           (list '* diff-product)
           (list 'expt diff-expt)))

 ;; filter func
  (define diff-filter 
    (lambda (op table) 
      (if (null? table)
          'error_unkonwn_operation
      (if (equal? op (car (car table)))
          (cadr (car table))
          (diff-filter op (cdr table)
          )))))

;implementation for main function diff
(define (diff x E) 
  (cond 
    ((or (number? E) (and (symbol? E) (not (equal? x E)))) 0)
    ((equal? x E) 1)
    (else ((diff-filter (car E) diff-dispatch) x (cdr E)))
    ))      