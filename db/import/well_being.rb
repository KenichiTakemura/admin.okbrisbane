# -*- coding: utf-8 -*-
require 'db/import/import_helper'

TopFeedList.category_feed(WellBeing.name).destroy_all
WellBeing.destroy_all

admin = Admin.post_admin.first

expiry = Common.current_time + 60.days

post = WellBeing.new(:subject => '대박을 드립니다.', :category => WellBeing::Categories[:event], :valid_until => expiry)
image = Image.new(:avatar => File.new("db/import/1320378217-49.jpg"))
post.save
image.attached_to_by(post, admin)
post.set_user(admin)
content = post.build_content(:body => %Q|<img src="#{image.original_image}"/>|)
content.save


post = WellBeing.new(:subject => '전문가들과의 무료상담.', :category => WellBeing::Categories[:event], :valid_until => expiry)
image = Image.new(:avatar => File.new("db/import/1320475698-19.jpg"))
post.save
image.attached_to_by(post, admin)
post.set_user(admin)
content = post.build_content(:body => %Q|<img src="#{image.original_image}"/>|)
content.save
