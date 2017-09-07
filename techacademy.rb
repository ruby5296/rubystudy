require 'nokogiri'
require 'open-uri'
require "FileUtils"

url ='https://techacademy.jp/magazine/6235#sec3'
file = open(url)
charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# ノコギリを使ってhtmlを解析
doc = Nokogiri::HTML.parse(html, charset)

url, filename = ARGV[0], ARGV[1]

puts file.base_uri
puts file.charset
puts file.content_type
puts file.last_modified
puts file.meta
puts file.status

open(url) do |file|
  open(filename, "w+b") do |out|
    out.write(file.read)
  end
end
