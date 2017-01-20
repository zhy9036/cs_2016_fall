language: PYTHON
name: "svmopt"

variable {
 name: "C"
 type: FLOAT
 size: 1
 min:  0.0001
 max:  10000
}
variable {
 name: "G"
 type: FLOAT
 size: 1
 min:  0.0001
 max:  10000
}



# Integer example
#
# variable {
#  name: "Y"
#  type: INT
#  size: 5
#  min:  -5
#  max:  5
# }

# Enumeration example
# 
# variable {
#  name: "Z"
#  type: ENUM
#  size: 3
#  options: "foo"
#  options: "bar"
#  options: "baz"
# }


