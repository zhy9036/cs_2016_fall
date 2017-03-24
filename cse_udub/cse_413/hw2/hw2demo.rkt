Welcome to DrRacket, version 6.1 [3m].
Language: racket; memory limit: 128 MB.
> ;; test cases for lengtht
(lengtht '())
0
> (lengtht '(1 2 3 4 5))
5
> (lengtht '((1 1) 2 3 4 5))
5
> ;; test cases for lengtht2
(lengtht2 '())
0
> (lengtht2 '(1 2 3 4 5))
5
> (lengtht2 '((1 2) 3 4 5))
5
> ;; test cases for poly
(poly 1 '(2 3 4 5 6))
20
> (+ 2 3 4 5 6)
20
> (poly 2 '(2 3 4))
24
> (+ 2 (* 2 3) (* 4 4))
24
> ;; test case for apply-all
(apply-all (list sqrt square cube) 4)
'(2 16 64)
> ;; test cases for all-are
((all-are positive?) '(1 2 3 4))
#t
> ((all-are even?) '(2 4 5 6 8))
#f
> ;; test cases for part III
; (1) make-expr, operator, left-op, right-op
(make-expr 4 '+ 5)
'(4 + 5)
> (make-expr '(6 * 3) '+ '(5 - 2))
'((6 * 3) + (5 - 2))
> (operator '((6 * 3) + (5 - 2)))
'+
> (left-op '((6 * 3) + (5 - 2)))
'(6 * 3)
> (right-op '((6 * 3) + (5 - 2)))
'(5 - 2)
> ; (2) preorder, inorder, postorder
(preorder '((((4 + 3) * (2 - 1)) * (3 / 1)) - ((2 + 5) * (1 + 1))))
'(- * * + 4 3 - 2 1 / 3 1 * + 2 5 + 1 1)
> (inorder '((((4 + 3) * (2 - 1)) * (3 / 1)) - ((2 + 5) * (1 + 1))))
'(4 + 3 * 2 - 1 * 3 / 1 - 2 + 5 * 1 + 1)
> (postorder '((((4 + 3) * (2 - 1)) * (3 / 1)) - ((2 + 5) * (1 + 1))))
'(4 3 + 2 1 - * 3 1 / * 2 5 + 1 1 + * -)
> ; test cases for eval-tree
(eval-tree '(1 + 2))
3
> (eval-tree '((((4 + 3) * (2 - 1)) * (3 / 1)) - ((2 + 5) * (1 + 1))))
7
> ; test cases for map-leaves
add1
#<procedure:add1>
> (map-leaves add1 '(1 + 2))
'(2 + 3)
> (map-leaves add1 '((((4 + 3) * (2 - 1)) * (3 / 1)) - ((2 + 5) * (1 + 1))))
'((((5 + 4) * (3 - 2)) * (4 / 2)) - ((3 + 6) * (2 + 2)))
> 