#! /usr/bin/env ruby

def ex
  yield
rescue
  "#{$!} (#{$!.class})"
end

if $0 == __FILE__
  ex{1.to_sym} # => "undefined method `to_sym' for 1:Fixnum (NoMethodError)"
  ex{1 + "1"}  # => "String can't be coerced into Fixnum (TypeError)"
  ex{"1" + 1}  # => "no implicit conversion of Fixnum into String (TypeError)"
end
