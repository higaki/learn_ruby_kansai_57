#! /usr/bin/env ruby

class Integer
  def factorial
    case
    when self <= 0 then raise ArgumentError
    when self <= 2 then self
    else [*2..self].inject(&:*)
    end
  end
end

if $0 == __FILE__
  require 'test/unit'
  class FactorialTest <Test::Unit::TestCase
    def test_0_factorial
      assert_raise(ArgumentError) do
        0.factorial
      end
    end

    def test_less_0_factorial
      [*-8..-1].each do |n|
        assert_raise(ArgumentError, "value: #{n}") do
          n.factorial
        end
      end
    end

    def test_factorial
      {1 => 1, 2 => 2, 3 => 6, 7 => 5040, 11 => 39916800, 13 => 6227020800}
        .each do |n, expected|
        assert_equal(expected, n.factorial)
      end
    end
  end
end
