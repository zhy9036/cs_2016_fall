
;;; CSE 413 HW 1
;;; Yang Zhang
;;; TEST CASES

;;; Test cases for p1 combnation
> (comb 5 3)
10
> (comb 13 5)
1287

;;; Test cases for p2 zip
> (zip '(1 2 3 4 5) '(a b c d e))
'(1 a 2 b 3 c 4 d 5 e)
> (zip '(1 2 3 4 5) '(a b c))
'(1 a 2 b 3 c 4 5)
> (zip '(1 2 3) '(a b c d e))
'(1 a 2 b 3 c d e)

;;; Test cases for p3 unzip
> (unzip '(1 a 2 b 3 c 4 d))
'((1 2 3 4) (a b c d))
> (unzip '(1 a 2 b 3 c 4))
'((1 2 3 4) (a b c))

;;; Test cases for p4 expand
> (expand '(a b c d e f))
'(a b c d e f)
> (expand '((1 a) b c d e f))
'(a b c d e f)
> (expand '((4 a) b c d (3 e) f))
'(a a a a b c d e e e f)


;;; Test cases for p5 (a)
  ; value
> (value '(2 () ()))
2
  ; left
> (left '(2 () ()))
'()
  ; right
> (right '(2 () ()))
'()


;;; Test cases for p5 (b) size
> (size '())
0
> (size '(2 () ()))
1
> (size '(2 (1 (5 (6 () ()) (8 () ())) ()) (3 () (4 () ()))))
7


;;; Test cases for p5 (c) contains
> (contains 2 '(2 (1 (5 (6 () ()) (8 () ())) ()) (3 () (4 () ()))))
#t
> (contains 8 '(2 (1 (5 (6 () ()) (8 () ())) ()) (3 () (4 () ()))))
#t
> (contains 12 '(2 (1 (5 (6 () ()) (8 () ())) ()) (3 () (4 () ()))))
#f

;;; Test cases for p5 (d) leaves
> (leaves '(2 () ()))
'(2)
> (leaves '(2 (1 (5 (6 () ()) (8 () ())) ()) (3 () (4 () ()))))
'(6 8 4)

;;; Test cases for p5 (e) isbst
> (isbst '())
#t
> (isbst '(2 () ()))
#t
> (isbst '(5 (3 () (6 () ())) (8 () ())))
#f
> (isbst '(5 (3 () (4 () ())) (8 () ())))
#t
> (isbst '(5 (3 () (4 () ())) (8 (1 () ()) ())))
#f
> (isbst '(5 (3 () (4 () ())) (8 (6 () ()) ())))
#t