# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed('Job').delete_all
Job.delete_all

# Sample Data
# Not for Production
admin = Admin.first

2010.upto(2020) do |x|
  job = Job.new(:category => Job::SEEK, :subject => "안녕 하세요 #{x}");
  job.valid_until = Time.now
  job.save
end
