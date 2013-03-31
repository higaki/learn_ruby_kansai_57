class MyError < StandardError; end

raise MyError, 'original'
