# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Accommodation.name).delete_all
Accommodation.delete_all

# Sample Data
# Not for Production
admin = Admin.first

1.upto(10) do |x|
  post = Accommodation.new(:category => "hotel", :subject => "숙학 정보 #{x}")
  post.build_content
  post.content(:body => "숙학 정보 #{x}")
  post.price = "199.99"
  post.room_type = Accommodation::ROOM_HOTEL
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  image = Image.new(:avatar => File.new("test/fixtures/accommodation/acm#{x}.jpg"))
  image.attached_to_by(post, admin)
end