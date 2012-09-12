# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Weather.destroy_all

# Sample Data
# Not for Production

issuedOn = Common.current_time - 1.day

WeatherConfig::AUSCityOrderList.each do |l|
  Weather.create(:issuedOn => issuedOn, :dateOn => Common.today, :location => l, :country => Okvalue::AU, :forecast => "sunny", :max => 10, :min => 0)
end

WeatherConfig::KORCityOrderList.each do |l|
  Weather.create(:issuedOn => issuedOn, :dateOn => Common.today, :location => l, :country => Okvalue::KR, :forecast => "mostly_cloudy", :max => 10, :min => 0)
end
