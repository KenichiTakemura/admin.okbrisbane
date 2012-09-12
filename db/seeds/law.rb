# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Law.name).delete_all
Law.delete_all

# Sample Data
# Not for Production
admin = Admin.first

expiry = Common.current_time + 30.days

1.upto(7) do |x|
  post = Law.new(:category => "for_traffic_accident", :subject => "[시티]공원속의 라이프스타일 #{x}", :valid_until => expiry)
  post.build_content
  post.content(:body => "[시티]공원속의 라이프스타일 #{x}")
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
end
