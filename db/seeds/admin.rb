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
Admin.create(:email => "kenichi_takemura1976@yahoo.com", :password => "sarang1107", :password_confirmation => "sarang1107",  :is_special => true)
Admin.create(:email => "mootal@hanmail.net", :password => 'kristaadams1', :password_confirmation => "kristaadams1",  :is_special => true)
