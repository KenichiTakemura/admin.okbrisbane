# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

happy_members = HappyMember.all
happy_members.each do |member|
  user = User.find_by_email(member.user_email)
  user.destroy if user.present?
  
  user_name = Okiconv.euckr_to_utf8(member.user_name)
  user_nick = Okiconv.euckr_to_utf8(member.user_nick)
  
  user = User.new(:email => member.user_email, :password => Okvalue::DEFAULT_PASSWORD, :password_confirmation => Okvalue::DEFAULT_PASSWORD, :user_name => user_name, :is_special => false, :confirmed_at => Common.current_time)
  user.reset_password_token = user_nick
  user.save
end



