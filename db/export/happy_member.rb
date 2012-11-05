# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

happy_members = HappyMember.all
File.open("db/export/HappyMember.t","w:utf-8") do |f|
  happy_members.each_with_index do |member,i|
    user_name = Okiconv.euckr_to_utf8(member.user_name)
    user_nick = Okiconv.euckr_to_utf8(member.user_nick)
    f.puts "#{i}\##{member.user_email}\##{user_name}\##{user_nick}"
  end
end



