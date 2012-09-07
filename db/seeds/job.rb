# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Job.name).delete_all
Job.delete_all

# Sample Data
# Not for Production
user = User.first

expiry = Time.now.utc + 30.days

1.upto(2) do |x|
  post = Job.new(:category => Job::Categories[:seek], :subject => "안녕 하세요 #{x}", :valid_until => expiry);
  content = post.build_content(:body => "안녕 하세요")
  post.save
  post.set_user(user)
  content.save
end

expiry = Time.now.utc + 1.days
post = Job.new(:category => Job::Categories[:seek], :subject => "안녕 하세요 #3", :valid_until => expiry);
content = post.build_content(:body => "안녕 하세요")
post.save
post.set_user(user)
content.save
Image.create(:avatar => File.new("test/fixtures/business/b1.jpg")).attached_to_by(post,user)  


1.upto(3) do |x|
  post = Job.new(:category => Job::Categories[:hire], :subject => "어서 오세요 #{x}", :valid_until => expiry);
  content = post.build_content(:body => "어서 오세요")
  post.save
  post.set_user(user)
  content.save
end