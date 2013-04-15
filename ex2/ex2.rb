def ex
  yield
rescue IndexError => ex
  # 親クラスで、ひとまとめに rescue
  ex.class
end

# 例外が発生しなければブロックの評価結果が返る
ex{1 + 1}                       # => 2

# KeyError の捕捉
ex{{}.fetch(:ex)}               # => KeyError

# StopIteration の捕捉
ex{[].each.next}                # => StopIteration

# 捕捉できない例外
ex{1 + "1"}                     # => 
# ~> -:18:in `+': String can't be coerced into Fixnum (TypeError)
# ~> 	from -:18:in `block in <main>'
# ~> 	from -:2:in `ex'
# ~> 	from -:18:in `<main>'
