num = ARGV[0].to_i
total_sum = [*1..num].inject { |sum, n| sum + n }
puts total_sum
