# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def getBanner(p, s, a)
  page_id = Style.pageid(p)
  section_id = Style.sectionid(s)
  position_id = a
  banner = Banner.where("page_id = ? AND section_id = ? AND position_id = ?", page_id, section_id, position_id).first
  BannerImage.where("banner_id = ?", banner).delete_all
  banner
end

# logo position
[:p_job,:p_buy_and_sell,:p_well_being,:p_study,:p_immig,:p_estate,:p_law,:p_tax,:p_yellowpage,:p_motor_vehicle,:p_business,:p_accommodation].each do |page|
  banner = getBanner(page,:s_body,1)
  client_images = ClientImage.where("original_size = ?", banner.img_resolution)
  client_images.each do |i|
    banner.attach(i)
  end
end

[:p_signin,:p_signup,:p_job,:p_buy_and_sell,:p_well_being,:p_study,:p_immig,:p_estate,:p_law,:p_tax,:p_yellowpage,:p_motor_vehicle,:p_business,:p_accommodation].each do |page|
  2.upto(5) do |x|
    banner = getBanner(page,:s_body,x)
    client_images = ClientImage.where("original_size = ?", banner.img_resolution)
    client_images.each do |i|
      banner.attach(i)
    end
  end
end

# Buy and Sell Related
[:p_estate,:p_motor_vehicle,:p_business,:p_accommodation].each do |page|
  6.upto(8) do |x|
    banner = getBanner(page,:s_body,x)
    client_images = ClientImage.where("original_size = ?", banner.img_resolution)
    client_images.each do |i|
      banner.attach(i)
    end
  end
end

# Signin
[:p_signin].each do |page|
  banner = getBanner(page,:s_body,6)
  client_images = ClientImage.where("original_size = ?", banner.img_resolution)
  client_images.each do |i|
    banner.attach(i)
  end
end
