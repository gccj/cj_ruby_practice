num = ARGV[0].to_i
puts [*1..num].inject { |sum, n| sum + n }
