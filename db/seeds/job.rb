# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Job.name).destroy_all
Job.destroy_all

# Sample Data
# Not for Production
user = User.first

expiry = Common.current_time + 60.days

59.downto(1) { |x|
  post = Job.new(:category => Job::Categories[:seek], :subject => "안녕 하세요 #{x}", :valid_until => expiry);
  post.created_at = Common.current_time - x.days
  content = post.build_content(:body => "안녕 하세요")
  post.save
  post.set_user(user)
  content.save
}

60.upto(100) { |x|
  post = Job.new(:category => Job::Categories[:seek], :subject => "안녕 하세요 #{x}", :valid_until => expiry);
  post.created_at = Common.current_time
  content = post.build_content(:body => "안녕 하세요")
  post.save
  post.set_user(user)
  content.save
}

159.downto(101) { |x|
  post = Job.new(:category => Job::Categories[:hire], :subject => "안녕 하세요 #{x}", :valid_until => expiry);
  post.created_at = Common.current_time - x.days
  content = post.build_content(:body => "안녕 하세요")
  post.save
  post.set_user(user)
  content.save
}

160.upto(200) { |x|
  post = Job.new(:category => Job::Categories[:hire], :subject => "안녕 하세요 #{x}", :valid_until => expiry);
  post.created_at = Common.current_time
  content = post.build_content(:body => "안녕 하세요")
  post.save
  post.set_user(user)
  content.save
}


