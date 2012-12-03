# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
QuickLink.destroy_all
# THIS SHOULD BE REMOVED AND DONE IN RAILS CONSOLE
# Administrators
QuickLink.create(:name => "이민성", :link_to => "http://www.immi.gov.au", :sort_key => 1)
QuickLink.create(:name => "Tax Office", :link_to => "http://www.ato.gov.au", :sort_key => 2)
QuickLink.create(:name => "브리즈번 City Council", :link_to => "http://www.brisbane.qld.gov.au", :sort_key => 3)
QuickLink.create(:name => "Translink", :link_to => "http://translink.com.au", :sort_key => 4)
QuickLink.create(:name => "Queensland Weather and Warnings", :link_to => "http://www.bom.gov.au/qld", :sort_key => 5)
QuickLink.create(:name => "브리즈번 국제공항", :link_to => "http://www.bne.com.au", :sort_key => 6)
QuickLink.create(:name => "Queensland Police Asian Specialist Unit", :link_to => "http://www.police.qld.gov.au/programs/community/asu/contact.htm", :sort_key => 7)
