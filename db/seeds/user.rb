# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.destroy_all
# THIS SHOULD BE REMOVED AND DONE IN RAILS CONSOLE
# Administrators
User.create(:email => "kenichi_takemura1976@yahoo.com", :password => 'kenichi123',
 :password_confirmation => 'kenichi123', :user_name => "다케무라 켄이치",
 :is_special => false, :confirmed_at => Common.current_time, :agreed_on => Common.current_time, :provider => User::PROVIDERS[:okbrisbane])
guest = User.new(:email => "okbrisbane_guest@okbrisbane.com", :user_name => "Guest",
 :is_special => true, :confirmed_at => Common.current_time, :agreed_on => Common.current_time, :provider => User::PROVIDERS[:okbrisbane])
guest.save(:validate => false)