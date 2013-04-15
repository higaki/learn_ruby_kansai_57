# 演習問題1

## いろいろな例外を発生させてみよう

	def ex
	  yield
	rescue
	  "#{$!} (#{$!.class})"
	end
	
	ex{1.to_sym} # => "undefined method `to_sym' for 1:Fixnum (NoMethodError)"
	ex{1 + "1"}  # => "String can't be coerced into Fixnum (TypeError)"
