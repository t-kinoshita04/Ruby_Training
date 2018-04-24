class Uruu

  def leap_year year
    if year % 400 == 0 || year % 4 == 0 && year % 100 != 0
      puts "#{year}年はうるう年です"
    else 
      puts "#{year}年はうるう年ではありません"
    end
  end
end
a = Uruu.new
a.leap_year(gets.to_i)




