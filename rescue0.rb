#! /usr/bin/env ruby
require './factorial'

def factorial(n)
  n.factorial
rescue ArgumentError
  "1以上の整数を指定してください"
rescue NoMethodError
  "整数を指定してください"
end

factorial 3     # => 6
factorial 4     # => 24
factorial 5     # => 120
factorial 0     # => "1以上の整数を指定してください"
factorial 2.5   # => "整数を指定してください"
factorial "2"   # => "整数を指定してください"
