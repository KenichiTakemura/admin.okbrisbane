# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
BusinessClient.delete_all
BusinessProfile.delete_all
BusinessProfileImage.delete_all
ClientImage.delete_all

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
addImage("test/fixtures/banner/body/5", client)
addImage("test/fixtures/banner/body/6", client)
client = BusinessClient.create(:business_name => "BBB Company Pty Ltd.", :business_abn => "12 3456 7890", :business_address => 'Shop123 456 ABC Hills QLD 1234', :business_url => 'http://www.abc.com.au', :business_phone => '07-1234-5678', :business_fax => '07-1234-5678', :business_email => 'abc@abc.com.au', :contact_name => '쉬운일입니다')
client.build_business_profile(:body => 'BBB rocks!')
client.save
addImage("test/fixtures/banner/head", client)
addImage("test/fixtures/banner/background", client)
addImage("test/fixtures/banner/body/1", client)
addImage("test/fixtures/banner/body/2", client)
addImage("test/fixtures/banner/body/3", client)
addImage("test/fixtures/banner/body/4", client)
addImage("test/fixtures/banner/body/5", client)
addImage("test/fixtures/banner/body/6", client)
