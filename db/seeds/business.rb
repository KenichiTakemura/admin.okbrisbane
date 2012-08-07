# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Business.name).delete_all
Business.delete_all

admin = Admin.first

1.upto(10) do |x|
  post = Business.new(:category => "for_sale", :subject => "비즈니스 #{x}")
  content = post.build_content(:body => "비즈니스 #{x}")
  post.price = "300000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  content.save
  image = Image.new(:avatar => File.new("test/fixtures/business/b#{x}.jpg"))
  image.attached_to(post)
end
