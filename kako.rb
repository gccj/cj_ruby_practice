# 「(」と「)」の数をチェック
def number_equal?(text)
  text.count('(') == text.count(')')
end

# 最初の括弧は「(」であるかどうかをチェック
def left_legal?(text)
  text[0] == '('
end

# 最後の括弧は「)」であるかどうかをチェック
def right_legal?(text)
  text[-1] == ')'
end

def space
  ' '
end

def left?(char)
  char == '('
end

def right?(char)
  char == ')'
end

# 括弧の対応関係をチェック
def legal?(text)
  !text.empty? && number_equal?(text) && left_legal?(text) && right_legal?(text)
end

# 開始（　と閉じる　）の間にスペースの数 defaultは0
def number_of_space(num = 0)
  @number_of_space ||= num.to_i
end

# 開始（　と閉じる　）の間にスペースを入れるかどうか
def need_space?
  number_of_space > 0
end

# 使用：「ruby kako.rb '8(())9()()()(rehgwerh)(erhyewrhw)()   ()' 2」でも処理する。

text = ARGV[0].gsub(/[^\(\)]/, '') # 不正のアルファベット、数値とスペースなどを取り除く

number_of_space ARGV[1] # 第二引数は開始（　と閉じる　）の間にスペース数を受け取る

# 括弧の対応関係が不正な場合エラーメッセージを表示して停止する
abort('括弧の対応関係が不正です。(()())のような正しいInputしてください') unless legal?(text)

@prechar = text.slice! 0
puts @prechar
@offset = 0
text.chars do |char|
  set_space = 0
  if left?(char) && left?(@prechar)
    @offset += 2
  elsif right?(char) && right?(@prechar)
    @offset -= 2
  elsif need_space? && right?(char) && left?(@prechar)
    set_space = number_of_space
  end
  @offset = 0 if @offset < 0
  puts "#{space * (@offset + set_space)}#{char}"
  @prechar = char
end
