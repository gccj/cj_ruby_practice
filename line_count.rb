file = ARGV[0]
puts File.read("#{file}").count("\n")