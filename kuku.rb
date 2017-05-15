array = [*1..9]
1.upto(9).each do |num|
  anw = array.collect {|n| n * num}
  printf "%2d| %2d| %2d| %2d| %2d| %2d| %2d| %2d| %2d|\n",  *anw
end