# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rate.delete_all

# Sample Data
# Not for Production

issuedOn = Time.now.utc - 1.day

Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::AU, :currency_to => Okvalue::KR, :buy_or_sell => RateConfig::BUY, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::NZ, :currency_to => Okvalue::KR, :buy_or_sell => RateConfig::BUY, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::AU, :currency_to => Okvalue::KR, :buy_or_sell => RateConfig::SELL, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::NZ, :currency_to => Okvalue::KR, :buy_or_sell => RateConfig::SELL, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::KR, :currency_to => Okvalue::AU, :buy_or_sell => RateConfig::BUY, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::KR, :currency_to => Okvalue::NZ, :buy_or_sell => RateConfig::BUY, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::KR, :currency_to => Okvalue::AU, :buy_or_sell => RateConfig::SELL, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
Rate.create(:issuedOn => issuedOn, :dateOn => Common.today, :currency_from => Okvalue::KR, :currency_to => Okvalue::NZ, :buy_or_sell => RateConfig::SELL, :rate_a => 1111.11, :rate_b => 2222.22, :rate_c => 3333.33)
