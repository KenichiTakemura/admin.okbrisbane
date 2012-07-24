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
Estate.delete_all
Business.delete_all


# Sample Data
# Not for Production
admin = Admin.first

1.upto(20) do |x|
  estate = Estate.new(:category => Estate::FOR_SALE, :subject => "#{x}년 北김정은, 공항에 불쑥 나타나 女스튜어디스에 말 걸며")
  estate.build_content
  estate.content(:body => "김연아, #{x}년 만에 '록산느의 탱고' 연기한다")
  estate.price = "1000.00"
  estate.valid_until = Time.now
  estate.set_user(admin)
  estate.save
end

1.upto(10) do |x|
  business = Business.new(:category => Estate::FOR_SALE, :subject => "#{x}년 北김정은, 공항에 불쑥 나타나 女스튜어디스에 말 걸며")
  business.build_content
  business.content(:body => "김연아, #{x}년 만에 '록산느의 탱고' 연기한다")
  business.price = "100000.00"
  business.valid_until = Time.now
  business.set_user(admin)
  business.save
end