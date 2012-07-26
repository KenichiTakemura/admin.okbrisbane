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
Admin.create(:email => "admin@okbrisbane.com", :password => "kristaadams111", :password_confirmation => "kristaadams111")

# Sample Data
# Not for Production
admin = Admin.first
2010.upto(2020) do |x|
  job = Job.new(:category => Job::SEEK, :subject => "#{x}년 北김정은, 공항에 불쑥 나타나 女스튜어디스에 말 걸며");
  job.valid_until = Time.now
  job.save
end
3000.upto(3020) do |x|
  bas = BuyAndSell.new(:category => BuyAndSell::BUY, :subject => "김연아, #{x}년 만에 '록산느의 탱고' 연기한다", :price => 3000.00);
  bas.valid_until = Time.now
  bas.save
end

client = BusinessClient.create(:business_name => "AAA Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'AAA rocks!')
client.save
client = BusinessClient.create(:business_name => "BBB Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'BBB rocks!')
client.save

1.upto(20) do |x|
  post = Estate.new(:category => Estate::FOR_SALE, :subject => "[시티]공원속의 라이프스타일 #{x}")
  post.build_content
  post.content(:body => "[시티]공원속의 라이프스타일 #{x}")
  post.price = "200000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  sleep 1
end

1.upto(10) do |x|
  post = Business.new(:category => Business::FOR_SALE, :subject => "비즈니스 #{x}")
  post.build_content
  post.content(:body => "비즈니스 #{x}")
  post.price = "300000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  sleep 1
end

1.upto(9) do |x|
  post = MotorVehicle.new(:category => MotorVehicle::FOR_SALE, :subject => "자동차 #{x}")
  post.build_content
  post.content(:body => "자동차 #{x}")
  post.price = "9999.99"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
  sleep 1
end
