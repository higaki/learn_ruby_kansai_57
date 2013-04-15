#! /usr/bin/env ruby

def ex
  yield
rescue Exception
  "#{$!} (#{$!.class})"
end

if $0 == __FILE__
  ex{1.to_sym} # => "undefined method `to_sym' for 1:Fixnum (NoMethodError)"
  ex{1 + "1"}  # => "String can't be coerced into Fixnum (TypeError)"
  ex{"1" + 1}  # => "no implicit conversion of Fixnum into String (TypeError)"
  ex{n + 1}    # => "undefined local variable or method `n' for main:Object (NameError)"
  ex{1 / 0}    # => "divided by 0 (ZeroDivisionError)"
  ex{require 'nothing'} # => "cannot load such file -- nothing (LoadError)"
  ex{open 'nothing'} # => "No such file or directory - nothing (Errno::ENOENT)"
  ex{eval "if"} # => "(eval):1: syntax error, unexpected end-of-input (SyntaxError)"
end
