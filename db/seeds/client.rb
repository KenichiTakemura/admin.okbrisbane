# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ClientImage.delete_all

# Admin
@admin = Admin.first

def addImage(dir, client)
  Dir.foreach(dir) do |filename|
    next if filename == "." || filename == ".."
    resolution = Kernel.`("/usr/bin/identify #{dir}/#{filename} | awk '{print $3}' | tr -d '\n'")
    client_image = ClientImage.new(:avatar => File.new("#{dir}/#{filename}"), :original_size => resolution, :source_url => "", :caption => "")
    client_image.attached_to_by(client, @admin)
  end
end

def addBusinessProfile(file, client, is_main)
  profile_image = BusinessProfileImage.new(:avatar => File.new(file), :is_main => is_main)
  profile_image.attached_to_by(client, @admin)
end

client = BusinessClient.find_by_business_name("AAA Company Pty Ltd.")
client.delete if client
client = BusinessClient.create(:business_name => "AAA Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'AAA rocks!')
client.save
addBusinessProfile("test/fixtures/businessclient/bp1.jpg", client, true)
addImage("test/fixtures/banner/head", client)
addImage("test/fixtures/banner/background", client)
addImage("test/fixtures/banner/body/1", client)
addImage("test/fixtures/banner/body/2", client)
addImage("test/fixtures/banner/body/3", client)
addImage("test/fixtures/banner/body/4", client)
addImage("test/fixtures/banner/body/5", client)
addImage("test/fixtures/banner/body/6", client)
addImage("test/fixtures/banner/body/7", client)
addImage("test/fixtures/banner/body/8", client)
addImage("test/fixtures/banner/body/9", client)
addImage("test/fixtures/banner/body/10", client)
addImage("test/fixtures/banner/body/99", client)
client_image = ClientImage.new(:source_url => "http://ads.yimg.com/la/adv/838460_230812/yahoo_sapphires_left_gutter_now_showing.jpg", :original_size => "160x800")
client_image.attached_to(client)
client_image = ClientImage.new(:source_url => "http://ads.yimg.com/la/adv/838460_230812/yahoo_sapphires_right_gutter_now_showing.jpg", :original_size => "160x800")
client_image.attached_to(client)
