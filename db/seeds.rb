# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.delete_all
User.delete_all
Page.delete_all
# Administrators
Admin.create(:email => "admin@okbrisbane.com", :password => "kristaadams111", :password_confirmation => "kristaadams111")
# Users
u = User.create(:email => "kenichi@okbrisbane.com", :password => 'kenichi123', :password_confirmation => 'kenichi123')
u = User.new(:email => "anonymous@okbrisbane.com")
u.save(:validate => false)
# Pages
Page::PAGES.each do |key, value|
  Page.create(:name => value)
end