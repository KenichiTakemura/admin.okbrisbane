# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Estate.name).destroy_all
Estate.destroy_all
Image.where("attached_type = 'Estate'").destroy_all
Attachment.where("attached_type = 'Estate'").destroy_all

admin = Admin.find_by_email(Okvalue::POST_ADMIN)

def post_expiry
  system_setting = SystemSetting.first
  Time.now + system_setting.post_expiry_length.days
end
subject = "미래를 내다보는 투자, Greenbank!"
post = Estate.new(:category => Estate::Categories[:for_sale], :subject => subject)
body = <<-HTML
브리즈번 최고의 계획도시.<br/>
Springfield Lake에서 차로 10분 거리에 모두가 주목하는 Greenbank입니다.<br/>
40acers가 넘는 땅에 지은지 1년이 안된 4bed 하우스가 있습니다.<br/>
미래를 내다보는 투자가라면 더 이상 좋을 수 없는 기회입니다.<br/>
HTML
  
content = post.build_content(:body => body)
post.price = "$1.6M"
post.address = "167 Roberts RD, Greenbank"
post.bed = 4
post.bath = 2
post.garage = 2
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_to = "http://qoq.com.au/korean/property/property_view.php?num=60"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/60_20120723142514.jpg", :link_to_url => link_to, :something => "This is a test message 1").attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723142635.jpg", :link_to_url => link_to, :something => "This is a test message 2").attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723142731.jpg", :link_to_url => link_to, :something => "This is a test message 3").attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723142817.jpg", :link_to_url => link_to, :something => "This is a test message 4").attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723142954.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723143046.jpg", :link_to_url => link_to, :something => "This is a test message 6").attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723143130.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120723143344.jpg", :link_to_url => link_to, :something => "This is a test message 8").attached_to_by(post, admin)

post = Estate.new(:category => Estate::Categories[:for_sale], :subject => "써니뱅크 Banoon역 도보거리")
body = <<-HTML
써니뱅크 Banoon역 5분 도보거리로 교통 편리한 위치의 예쁜 하우스입니다.<br/>
최근 리노베이션으로 깨끗하게 단장하였으며, 넉넉한 사이즈의 3베드룸에 스터디룸이 하나 더 있습니다.<br/>
아담한 뒷마당은 쉬운 관리로 집에 넉넉한 여유를 가지게 합니다.<br/>
OPEN HOUSE는 6월 23일 토요일 오전 11시이지만, 약속을 미리 잡으시면 다른 시간에도 가능합니다.<br/>
<br/>
HTML
content = post.build_content(:body => body)
post.price = "$399,000"
post.address = "banoon station"
post.bed = 3
post.bath = 1
post.garage = 1
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_to = "http://qoq.com.au/korean/property/property_view.php?num=47"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/47_20120622135306.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135455.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135525.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135543.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135558.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135615.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135631.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135642.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135700.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135717.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135736.jpg", :link_to_url => link_to).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120622135752.jpg", :link_to_url => link_to).attached_to_by(post, admin)
