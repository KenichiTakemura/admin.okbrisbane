# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
admin = Admin.find_by_email(Okvalue::POST_ADMIN)

# QOQ
qoq = BusinessClient.find_by_business_name("QOQ Pty Ltd")
qoq.destroy if qoq.present?
qoq = BusinessClient.create(:business_name => "QOQ Pty Ltd", :business_abn => "38 148 089 892", :business_address => 'Shop 3 6 Zamia Street Sunny Bank QLD 4109', :business_url => 'http://www.qoq.com.au', :business_phone => '07 3345 8424', :business_fax => '07 3343 8558', :business_email => 'info@qoq.com.au', :contact_name => 'Elliott Joo')
qoq.build_business_profile(:head => "韓・中 부동산의 중심 QOQ 부동산", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/about/aboutus.jpg"/>|)
qoq.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/qoq_logo.png"), :is_main => true)
image.attached_to_by(qoq, admin)
image.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/qoq_logo1.png"), :is_main => true)
image.attached_to_by(qoq, admin)
image.save


hanin = BusinessClient.find_by_business_name("Hanin Lawyers")
hanin.destroy if hanin.present?
hanin = BusinessClient.create(:business_name => "Hanin Lawyers", :business_abn => "", :business_address => "", :business_url => "", :business_phone => '07 3343 8880', :business_fax => '07 3343 8558', :business_email => 'mootal@hanmail.net', :contact_name => 'Elliott Joo')
hanin.build_business_profile(:head => "韓人 Hanin Lawyers", :body => %Q|<img src="http://www.qoq.com.au/korean/_images/legal/leagal_middle2.png"/>|)
hanin.save
image = BusinessProfileImage.new(:avatar => File.new("public/images/HaninLawyers.jpg"), :is_main => true)
image.attached_to_by(hanin, admin)
image.save
