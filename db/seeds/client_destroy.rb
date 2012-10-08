# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

qoq = BusinessClient.find_by_business_name("QOQ Pty Ltd")
qoq.destroy if qoq.present?
hanin = BusinessClient.find_by_business_name("Hanin Lawyers")
hanin.destroy if hanin.present?
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
end
