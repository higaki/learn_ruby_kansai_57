#! /usr/bin/env ruby
require './factorial'

def fact(n)
  n.factorial
rescue ArgumentError
  "1以上の整数を指定してください"
rescue NoMethodError
  "整数を指定してください"
end

fact 3      # => 6
fact 4      # => 24
fact 5      # => 120
fact 0      # => "1以上の整数を指定してください"
fact 2.5    # => "整数を指定してください"
fact "2"    # => "整数を指定してください"
