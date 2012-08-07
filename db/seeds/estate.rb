# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Estate.name).delete_all
Estate.delete_all

# Sample Data
# Not for Production
admin = Admin.first

subject = "This is an awesome property."
body = "런던올림픽 개막을 앞고 가진 지난 2번(뉴질랜드, 세네갈)의 평가전에서 2경기 연속골을 터트리며 팀에 승리를 안겼던 박주영(27, 아스날)이었기에 멕시코전에 대한 기대감이 누구보다 컸던 게 사실이었다."

1.upto(5) do |x|
  post = Estate.new(:category => "for_sale", :subject => subject)
  content = post.build_content(:body => body)
  post.price = "200000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  content.save
  image = Image.new(:avatar => File.new("test/fixtures/estate/p#{x}.jpg"))
  image.attached_to(post)
end

6.upto(10) do |x|
  post = Estate.new(:category => "for_auction", :subject => subject)
  content = post.build_content(:body => body)
  post.price = "200000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  content.save
  image = Image.new(:avatar => File.new("test/fixtures/estate/p#{x}.jpg"))
  image.attached_to(post)
end
