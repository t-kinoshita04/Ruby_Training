require 'sqlite3'

class Book
  #テーブルを作成
  def create
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL)
        CREATE TABLE books
          (name TEXT, price INTEGER)
        SQL
    end
  end
  #データを登録
  def insert
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL)
        INSERT INTO books
        VALUES  ("楽しいRuby", 2600),
                ("優しいRuby", 13000),
                ("楽しいC", 50000),
                ("優しいC", 1000)
      SQL
    end
  end
  #条件に合った情報を取得
  def select
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|rows| p rows}
        SELECT * FROM books
        WHERE name LIKE "%楽しい%"
        OR price >= 10000;
      SQL
    end
  end
  #昇順
  def order_asc
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|rows| p rows}
        SELECT * FROM books
        ORDER BY name ASC;
      SQL
    end 
  end
  #降順
  def order_desc
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|rows| p rows}
        SELECT * FROM books
        ORDER BY price DESC;
      SQL
    end
  end
  #更新
  def update
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|rows| p rows}
        UPDATE books
        SET price = 2500
        WHERE name = "楽しいRuby";
      SQL
    end
  end
end

book = Book.new
book.create
book.insert
puts "------------------"
book.select
puts "------------------"
book.order_asc
puts "------------------"
book.order_desc
puts "------------------"
book.update