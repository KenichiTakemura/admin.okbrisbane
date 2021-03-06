# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def getBanner(p, s, a)
  page_id = Style.pageid_key(p)
  section_id = Style.sectionid(s)
  position_id = a
  banner = Banner.where("page_id = ? AND section_id = ? AND position_id = ?", page_id, section_id, position_id).first
  BannerImage.where("banner_id = ?", banner).destroy_all
  banner
end

# Main Header #1
Style.banner_pages.each do |key, value|
  1.upto(2) do |x|
    banner = getBanner(key,:s_header,x)
    client_images = ClientImage.where("original_size = ?", banner.img_resolution)
    client_images.each do |i|
     banner.attach(i)
    end
  end
end
