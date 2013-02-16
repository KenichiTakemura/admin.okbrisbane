# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.destroy_all
# THIS SHOULD BE REMOVED AND DONE IN RAILS CONSOLE
# Administrators
admin = Admin.create(:email => "kenichi_takemura1976@yahoo.com", :password => "sarang1107", :password_confirmation => "sarang1107",  :is_special => false)
admin = Admin.create(:email => Okvalue::POST_ADMIN, :password => "1fU^#Ue&,TW=$qUE1", :password_confirmation => "1fU^#Ue&,TW=$qUE1",  :is_special => true)
admin = Admin.create(:email => "mootal@hanmail.net", :password => 'kristaadams1', :password_confirmation => "kristaadams1",  :is_special => true)
#admin = Admin.create(:email => "0hurricane0@naver.com", :password => 'designer_password12345', :password_confirmation => "designer_password12345",  :is_special => false)
#admin.disable_role(:m_sales)
#admin.disable_role(:m_post)
#admin.disable_role(:m_user)
#admin.disable_role(:m_site)
#admin.disable_role(:m_system_setting)
admin = Admin.create(:email => "brstrathpine@naver.com", :password => 'okbrisbane', :password_confirmation => "okbrisbane",  :is_special => true)
admin = Admin.create(:email => "sskalex66@gmail.com", :password => 'okbrisbane', :password_confirmation => "okbrisbane",  :is_special => true)
