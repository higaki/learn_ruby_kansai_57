#! /usr/bin/env ruby
require './factorial'

3.factorial   rescue 0  # => 6
4.factorial   rescue 0  # => 24
5.factorial   rescue 0  # => 120
0.factorial   rescue 0  # => 0
2.5.factorial rescue 0  # => 0
"2".factorial rescue 0  # => 0
