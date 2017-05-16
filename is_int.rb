text = ARGV[0]

def integer?(text)
  text =~ /^\d+$/ ? '整数値が入力されました' : '整数値以外が入力されました'
end

puts integer?(text)
