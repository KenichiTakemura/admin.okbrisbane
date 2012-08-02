# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(MotorVehicle.name).delete_all
MotorVehicle.delete_all

# Sample Data
# Not for Production
admin = Admin.first

subject = "2009 FG XR6 Falcon"

1.upto(10) do |x|
  post = MotorVehicle.new(:category => MotorVehicle::Category[:new_car], :subject => subject)
  content = post.build_content(:body => "Very popular sedan finished in black, 5 speed manual, powerful 2.0L engine, many standard features.")
  post.price = "9999.99"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  content.save
  image = Image.new(:avatar => File.new("test/fixtures/car/car#{x}.jpg"))
  image.attached_to(post)
end
