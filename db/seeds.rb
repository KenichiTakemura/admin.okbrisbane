# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.delete_all
# Administrators
Admin.create(:email => "admin@okbrisbane.com", :password => "kristaadams111", :password_confirmation => "kristaadams111")

# Okbrisbane
TopFeedList.delete_all
Estate.delete_all
Business.delete_all
MotorVehicle.delete_all

# Sample Data
# Not for Production
admin = Admin.first

1.upto(20) do |x|
  post = Estate.new(:category => Estate::FOR_SALE, :subject => "부동산 #{x}")
  post.build_content
  post.content(:body => "부동산 #{x}")
  post.price = "200000.00"
  post.valid_until = Time.now
  post.set_user(admin)
  post.save
end

1.upto(10) do |x|
  post = Business.new(:category => Business::FOR_SALE, :subject => "비즈니스 #{x}")
  post.build_content
  post.content(:body => "비즈니스 #{x}")
  post.price = "300000.00"
  post.valid_until = Time.now
  post.set_user(admin)
  post.save
end

1.upto(9) do |x|
  post = MotorVehicle.new(:category => MotorVehicle::FOR_SALE, :subject => "자동차 #{x}")
  post.build_content
  post.content(:body => "자동차 #{x}")
  post.price = "9999.99"
  post.valid_until = Time.now
  post.set_user(admin)
  post.save
end