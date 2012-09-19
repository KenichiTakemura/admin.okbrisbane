# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
BusinessCategory.destroy_all

f = File.open("#{Rails.root}/config/locales/business_category.txt", "r:utf-8")
lines = f.readlines
lines.each_with_index do |line,x|
  category = line.split("#")
  BusinessCategory.create(:en_name => "BusinessCategory_#{x}", :display_name => category[0], :search_keyword => category[1])
end
