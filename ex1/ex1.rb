#! /usr/bin/env ruby

def ex
  yield
rescue Exception
  "#{$!} (#{$!.class})"
end

if $0 == __FILE__
  # Exception
  # NoMemoryError
  # ScriptError
  ex{require 'nothing'} # => "cannot load such file -- nothing (LoadError)"
  # NotImplementedError
  ex{eval "if"} # => "(eval):1: syntax error, unexpected end-of-input (SyntaxError)"
  # SecurityError
  ex{system "kill -TERM #{$$}"} # => "SIGTERM (SignalException)"
  ex{system "kill -INT #{$$}"}  # => " (Interrupt)"
  # StandardError
  ex{[].at} # => "wrong number of arguments (0 for 1) (ArgumentError)"
  # EncodingError
  ex{"あ" + "い".encode(Encoding::CP932)} # => "incompatible character encodings: UTF-8 and Windows-31J (Encoding::CompatibilityError)"
  ex{"環境に依存".encode(Encoding::BIG5)} # => "U+306B from UTF-8 to Big5 (Encoding::UndefinedConversionError)"
  # Encoding::InvalidByteSequenceError
  ex{"☺".encode(Encoding::CP932)} # => "U+263A from UTF-8 to Windows-31J (Encoding::UndefinedConversionError)"
  # FiberError
  # IOError
  ex{open("/dev/null", &:readline)} # => "end of file reached (EOFError)"
  # IndexError
  ex{{}.fetch(:none)}           # => "key not found: :none (KeyError)"
  ex{[].each.next}              # => "iteration reached an end (StopIteration)"
  # LocalJumpError
  # Math::DomainError
  ex{n + 1} # => "undefined local variable or method `n' for main:Object (NameError)"
  ex{1.to_sym} # => "undefined method `to_sym' for 1:Fixnum (NoMethodError)"
  # RangeError
  ex{Float::NAN.to_i}           # => "NaN (FloatDomainError)"
  # RegexpError
  # RuntimeError
  # SystemCallError
  ex{open 'nothing'} # => "No such file or directory - nothing (Errno::ENOENT)"
  # ThreadError
  ex{1 + "1"}  # => "String can't be coerced into Fixnum (TypeError)"
  ex{"1" + 1}  # => "no implicit conversion of Fixnum into String (TypeError)"
  ex{1 / 0}    # => "divided by 0 (ZeroDivisionError)"
  # SystemExit
  # SystemStackError
  # fatal
end
