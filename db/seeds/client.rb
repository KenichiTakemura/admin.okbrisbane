# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
admin = Admin.find_by_email(Okvalue::POST_ADMIN)

qoq = BusinessClient.find_by_business_name("QOQ Pty Ltd")
qoq.destroy if qoq.present?
category = BusinessCategory.find_by_display_name("부동산")
qoq = BusinessClient.new(:business_name => "QOQ Pty Ltd", :business_abn => "38 148 089 892", :business_address => 'Shop 3 6 Zamia Street Sunny Bank QLD 4109', :business_url => 'http://www.qoq.com.au', :business_phone => '07 3345 8424', :business_fax => '07 3343 8558', :business_email => 'info@qoq.com.au', :contact_name => 'Elliott Joo')
qoq.business_category = category
qoq.build_business_profile(:head => "韓・中 부동산의 중심 QOQ 부동산", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/about/aboutus.jpg"/>|)
qoq.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/business_profile/qoq_logo.png"), :is_main => true)
image.attached_to_by(qoq, admin)
image.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/business_profile/qoq_logo1.png"), :is_main => true)
image.attached_to_by(qoq, admin)
image.save
hanin = BusinessClient.find_by_business_name("Hanin Lawyers")
hanin.destroy if hanin.present?
hanin = BusinessClient.new(:business_name => "Hanin Lawyers", :business_abn => "", :business_address => "", :business_url => "", :business_phone => '07 3343 8880', :business_fax => '07 3343 8558', :business_email => 'mootal@hanmail.net', :contact_name => 'Elliott Joo')
category = BusinessCategory.find_by_display_name("변호사")
hanin.business_category = category
hanin.build_business_profile(:head => "韓人 Hanin Lawyers", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/legal/leagal_middle2.png"/>|)
hanin.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/business_profile/HaninLawyers.jpg"), :is_main => true)
image.attached_to_by(hanin, admin)
image.save

f = File.open("#{Rails.root}/config/locales/business_client.txt", "r:utf-8")
lines = f.readlines
lines.each_with_index do |line,x|
  c = line.split("#")
  business_key = c[0]
  business_name = c[1].strip
  business_phone = c[2].strip
  business_address = c[3].strip
  client = BusinessClient.find_by_business_name(business_name)
  client.destroy if client.present?
  client = BusinessClient.new(:business_name => business_name, :business_abn => "", :business_address => business_address, :business_url => "", :business_phone => business_phone, :business_fax => "", :business_email => "", :contact_name => "")
  client.build_business_profile(:head => business_name, :body => business_name)
  client.save
  Dir["#{Rails.root}/config/locales/banners/#{business_key}/*"].each do |filename|
    # skip profile name
    next if File.directory?(filename)
    puts "Importing #{filename} to #{business_name}"
    banner = ClientImage.new(:avatar => File.new(filename),:link_to_url => "", :caption => "", :source_url => "")
    banner.attached_to_by(client, admin)
  end

end
