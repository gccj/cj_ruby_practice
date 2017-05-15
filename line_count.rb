file = ARGV[0]
puts File.read(file.to_s).count("\n")
