class Csv
  #csvファイルとDateを使えるようにする
  require "csv"
  require "date"
  #実行
  def csv_exe
    #csvの読み込み
    csvlines =  CSV.read("timesheet201804.csv", headers: true)
    #曜日ごとの作業時間を入れるための変数
    mon = tue = wed = thu = fri = sat = sun = 0
    #csvファイルを最後まで繰り返す
    csvlines.each do |csvline|
      dates = csvline.to_s.split(/,/)
      puts dates
      #文字型からデータ型に変換
      work_date = Date.parse(csvline["勤務日"])
      #曜日に変換
      wday = work_date.wday
      #wdayの値によって条件分岐
      case wday
      when 0
        sun += csvline["作業時間"].to_f
      when 1
        mon += csvline["作業時間"].to_f
      when 2
        tue += csvline["作業時間"].to_f
      when 3
        wed += csvline["作業時間"].to_f
      when 4
        thu += csvline["作業時間"].to_f
      when 5
        fri += csvline["作業時間"].to_f
      when 6
        sat += csvline["作業時間"].to_f
      # when 7
        # sun += csvline["作業時間"].to_f
      end
    end
    p "#{csvlines["勤務日"].last}-#{csvlines["勤務日"].first}"
    p "MON #{mon}"
    p "TUE #{tue}"
    p "WED #{wed}"
    p "THU #{thu}"
    p "FRI #{fri}"
    p "SAT #{sat}"
    p "SUN #{sun}"
  end
end

output = Csv.new
output.csv_exe