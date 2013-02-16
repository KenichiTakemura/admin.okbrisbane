# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
admin = Admin.find_by_email(Okvalue::POST_ADMIN)

BusinessClient.destroy_all
BusinessProfile.destroy_all
BusinessProfileImage.destroy_all

# OKBRISBANE 
ok = BusinessClient.create(:business_name => Okvalue::BUSINESS_CLIENT_OK, :business_abn => "98 152 354 768", :business_address => 'Shop 3 6 Zamia Street Sunny Bank QLD 4109', :business_url => 'http://www.okbrisbane.com', :business_phone => '07-3345-3256', :business_fax => '07-3343-8558', :business_email => 'contact@okbrisbane.com', :contact_name => '김 성수')
ok.build_business_profile(:head => "OKBRISBANE", :body => 'OKBRISBANE rocks!')
ok.save
#image = BusinessProfileImage.new(:avatar => File.new("public/images/logo.png"), :is_main => true)
#image.attached_to(ok)
#image.save


qoq = BusinessClient.find_by_business_name("QOQ Pty Ltd")
qoq.destroy if qoq.present?
category = BusinessCategory.find_by_display_name("부동산")
qoq = BusinessClient.new(:business_name => "QOQ Pty Ltd", :business_abn => "38 148 089 892", :business_address => 'Shop 3 6 Zamia Street Sunny Bank QLD 4109', :business_url => 'http://www.qoq.com.au', :business_phone => '07 3345 8424', :business_fax => '07 3343 8558', :business_email => 'info@qoq.com.au', :contact_name => 'Elliott Joo')
qoq.business_category = category
qoq.build_business_profile(:head => "韓・中 부동산의 중심 QOQ 부동산", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/about/aboutus.jpg"/>|)
qoq.save
#image = BusinessProfileImage.new(:avatar => File.new("#{Rails.root}/config/locales/banners/qoq/qoq.jpg"), :is_main => true)
#image.attached_to_by(qoq, admin)
#image.save
#Dir["#{Rails.root}/config/locales/banners/qoq/*"].each do |filename|
  # skip profile name
 # next if File.directory?(filename)
#  puts "Importing #{filename} to qoq"
# banner = ClientImage.new(:avatar => File.new(filename), :link_to_url => "http://www.qoq.com.au/", :caption => "", :source_url => "")
#  banner.attached_to_by(qoq, admin)
#end


hanin = BusinessClient.find_by_business_name("Hanin Lawyers")
hanin.destroy if hanin.present?
hanin = BusinessClient.new(:business_name => "Hanin Lawyers", :business_abn => "", :business_address => "", :business_url => "", :business_phone => '07 3343 8880', :business_fax => '07 3343 8558', :business_email => 'mootal@hanmail.net', :contact_name => 'Elliott Joo')
category = BusinessCategory.find_by_display_name("변호사")
hanin.business_category = category
hanin.build_business_profile(:head => "韓人 Hanin Lawyers", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/legal/leagal_middle2.png"/>|)
hanin.save
#image = BusinessProfileImage.new(:avatar => File.new("#{Rails.root}/config/locales/banners/hannin/HaninLawyers.jpg"), :is_main => true)
#image.attached_to_by(hanin, admin)
#image.save

f = File.open("#{Rails.root}/config/locales/bussiness_client.txt", "r:utf-8")
lines = f.readlines
lines.each_with_index do |line,x|
  c = line.split("#")
  business_name = c[0]
  business_address = c[1]
  business_abn = c[2]
  business_url = c[3].strip
  business_phone = c[4]
  business_fax = c[5]
  business_email = c[6].strip
  contact_name = c[7]
  search_keyword = c[9]
  client = BusinessClient.new(:business_name => business_name, :business_abn => business_abn, :business_address => business_address,
  :business_url => business_url, :business_phone => business_phone, :business_fax => business_fax, :business_email => business_email,
   :contact_name => contact_name, :search_keyword => search_keyword)
  client.build_business_profile(:head => business_name, :body => business_name)
  category = BusinessCategory.find_by_display_name(c[8])
  client.business_category = category
  client.save
  #Dir["#{Rails.root}/config/locales/banners/#{business_key}/*"].each do |filename|
  #  # skip profile name
  #  next if File.directory?(filename)
  #  puts "Importing #{filename} to #{business_name}"
  #  banner = ClientImage.new(:avatar => File.new(filename),:link_to_url => "", :caption => "", :source_url => "")
  #  banner.attached_to_by(client, admin)
  #end

end
