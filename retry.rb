#! /usr/bin/env ruby

files = %w[file.txt file1.txt file2.txt]

files.each do |fn|
  begin
    open(fn, 'w'){|f| f.puts "Ruby!!"}
    break
  rescue => ex
    $stderr.puts "#{ex} (#{ex.class})"
  end
end
