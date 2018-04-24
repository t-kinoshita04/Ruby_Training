class Number
  # 初期値を設定
  def initialize
    # 1から100までのランダムな値を変数に代入
    @answer = rand(1..100)
  end

  # 実行
  def anticipated_number
    # カウンタ
    count = 1
    # 数値が当たるまでループを続ける
    loop do
      # 入力した値を変数に代入
      num = gets.to_i
       # 答えと入力した値が一致したらループから抜ける
       break if num == @answer
       # numが@answerより小さかったとき
      if num < @answer
        puts "#{num}は正解より小さいです。"
      else
        puts "#{num}は正解より大きいです。"
      end
      
      count += 1
    end

    puts "正解です。正解まで#{count}回答えました。"
  end
end

a = Number.new
a.anticipated_number