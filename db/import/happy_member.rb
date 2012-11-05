# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fd = File.open("db/export/HappyMember.t", "r:utf-8")
lines = fd.readlines
lines.each_with_index do |line,x|
  item = line.split("#")
  user_email = item[1]
  user_name = item[2]
  user_nick = item[3].chomp!
  puts "#{user_email}"
  
  user = User.find_by_email(user_email)
  user.destroy if user.present?

  user = User.new(:email => user_email, :password => Okvalue::DEFAULT_PASSWORD, :password_confirmation => Okvalue::DEFAULT_PASSWORD, :user_name => user_name, :is_special => false, :confirmed_at => Common.current_time)
  user.reset_password_token = user_nick
  user.save
end


