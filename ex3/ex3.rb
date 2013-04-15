# どんな例外が発生するか
[0..9].map{|i| i * 2}
# ~> -:3:in `block in <main>': undefined method `*' for 0..9:Range (NoMethodError)
# ~> 	from -:3:in `map'
# ~> 	from -:3:in `<main>'


# 本当は何をしたかったのか

# [0, 2, 4, 6, 8, 10, 12, 14, 16, 18] という Array が欲しかったのでは


# 修正してみよう

(0..9).map{|i| i * 2}   # => [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

# or

[*0..9].map{|i| i * 2}  # => [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]