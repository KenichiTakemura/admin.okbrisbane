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

BusinessClient.delete_all
BusinessProfile.delete_all
BusinessProfileImage.delete_all
TopFeedList.delete_all
Job.delete_all
BuyAndSell.delete_all
Estate.delete_all
Business.delete_all
MotorVehicle.delete_all
Accommodation.delete_all
Law.delete_all
Study.delete_all
Immigration.delete_all
Tax.delete_all
Image.delete_all
ClientImage.delete_all
Attachment.delete_all

# OKBRISBANE 
ok = BusinessClient.create(:business_name => "OKBRISBANE", :business_abn => "", :business_address => 'Shop 3 6 Zamia Street Sunny Bank QLD 4109', :business_url => 'http://www.okbrisbane.com', :business_phone => '07-3343-8880', :business_fax => '07-3343-8558', :business_email => 'mootal@hanmail.net', :contact_name => 'Elliott Joo')
ok.build_business_profile(:body => 'OKBRISBANE rocks!')
ok.save

# Sample Data
# Not for Production
admin = Admin.first
2010.upto(2020) do |x|
  job = Job.new(:category => Job::SEEK, :subject => "안녕 하세요 #{x}");
  job.valid_until = Time.now
  job.save
end
3000.upto(3010) do |x|
  bas = BuyAndSell.new(:category => BuyAndSell::BUY, :subject => "안녕 하세요 #{x}", :price => 3000.00);
  bas.valid_until = Time.now
  bas.save
end

def addImage(dir, client)
  Dir.foreach(dir) do |filename|
    next if filename == "." || filename == ".."
    resolution = Kernel.`("/usr/bin/identify #{dir}/#{filename} | awk '{print $3}' | tr -d '\n'")
    client_image = ClientImage.new(:avatar => File.new("#{dir}/#{filename}"), :original_size => resolution)
    client_image.business_client_id = client.id
    client_image.save
  end
end

client = BusinessClient.create(:business_name => "AAA Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'AAA rocks!')
client.save
addImage("test/fixtures/banner/head", client)
addImage("test/fixtures/banner/background", client)
addImage("test/fixtures/banner/body/1", client)
addImage("test/fixtures/banner/body/2", client)
addImage("test/fixtures/banner/body/3", client)
addImage("test/fixtures/banner/body/4", client)
client = BusinessClient.create(:business_name => "BBB Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'BBB rocks!')
client.save

subject = "런던올림픽 개막을 앞고 가진 지난 2번(뉴질랜드, 세네갈)의 평가전에서 2경기 연속골을 터트리며 팀에 승리를 안겼던 박주영(27, 아스날)이었기에 멕시코전에 대한 기대감이 누구보다 컸던 게 사실이었다."

1.upto(10) do |x|
  post = Estate.new(:category => Estate::FOR_SALE, :subject => subject)
  post.build_content
  post.content(:body => "부동산 #{x}")
  post.price = "200000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  # adding an image
  post.save
#  image = Image.new(:avatar => File.new("test/fixtures/estate/p#{x}.jpg"))
#  image.attached_to(post)
end

1.upto(10) do |x|
  post = Business.new(:category => Business::FOR_SALE, :subject => subject)
  post.build_content
  post.content(:body => "비즈니스 #{x}")
  post.price = "300000.00"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
#  image = Image.new(:avatar => File.new("test/fixtures/business/b#{x}.jpg"))
#  image.attached_to(post)
end

1.upto(10) do |x|
  post = MotorVehicle.new(:category => MotorVehicle::FOR_SALE, :subject => subject)
  post.build_content
  post.content(:body => "자동차 #{x}")
  post.price = "9999.99"
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
#  image = Image.new(:avatar => File.new("test/fixtures/car/car#{x}.jpg"))
#  image.attached_to(post)
end

1.upto(10) do |x|
  post = Accommodation.new(:category => Accommodation::HOTEL, :subject => subject)
  post.build_content
  post.content(:body => "숙학 정보 #{x}")
  post.price = "199.99"
  post.room_type = Accommodation::ROOM_HOTEL
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
#  image = Image.new(:avatar => File.new("test/fixtures/accommodation/acm#{x}.jpg"))
#  image.attached_to(post)
end

1.upto(7) do |x|
  post = Law.new(:category => Law::FOR_ACCIDENT, :subject => "[시티]공원속의 라이프스타일 #{x}")
  post.build_content
  post.content(:body => "[시티]공원속의 라이프스타일 #{x}")
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
end

1.upto(10) do |x|
  post = Study.new(:category => Study::FOR_STUDY_OVERSEAS, :subject => "[시티]공원속의 라이프스타일 #{x}")
  post.build_content
  post.content(:body => "[시티]공원속의 라이프스타일 #{x}")
  post.valid_until = Time.utc(2012,7,"#{x}")
  post.set_user(admin)
  post.save
end
