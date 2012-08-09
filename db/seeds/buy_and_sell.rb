# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(BuyAndSell.name).delete_all
Job.delete_all

# Sample Data
# Not for Production
user = User.first

2010.upto(2050) do |x|
  post = BuyAndSell.new(:category => "buying", :subject => "안녕 하세요 #{x}");
  post.valid_until = Time.now
  content = post.build_content(:body => "안녕 하세요")
  post.set_user(user)
  post.save
  content.save
end

2100.upto(2150) do |x|
  post = BuyAndSell.new(:category => "selling", :subject => "어서 오세요 #{x}");
  post.valid_until = Time.now
  content = post.build_content(:body => "어서 오세요")
  post.set_user(user)
  post.save
  content.save
end