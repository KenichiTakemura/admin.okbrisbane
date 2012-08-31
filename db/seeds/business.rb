# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Business.name).delete_all
Business.delete_all

admin = Admin.first

def post_expiry
  system_setting = SystemSetting.first
  Time.now + system_setting.post_expiry_length.days
end
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "브리즈번 베스트 이글보이즈 차이나타운!")
body = <<-HTML
  호주 최고의 베스트 피자 프랜차이즈 이글보이즈가Fortitude Valley(차이나타운)에 나왔습니다.<br/>
  주당 매출 $16,000 이상을 기복없이 기록하며 브리즈번 TOP3 프랜차이즈로 이미 많은 단골을 확보하고 있습니다
HTML
content = post.build_content(:body => body)
post.price = "Offer over $430,000"
post.address = "Fortitude Valley, Brisbane"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=61"
Image.create(:source_url => "http://qoq.com.au/_data/property/61_20120725100055.jpg", :link_to_url => link_url).attached_to(post)
Image.create(:source_url => "http://qoq.com.au/_data/property/_20120725100201.jpg", :link_to_url => link_url).attached_to(post)
Image.create(:source_url => "http://qoq.com.au/_data/property/_20120725100300.jpg", :link_to_url => link_url).attached_to(post)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "편의점, 웨스트엔드")
body = <<-HTML
항상 젊은이들로 넘쳐나는 웨스트엔드 거리에 위치한 편의점입니다.<br>
편의점과 한국 슈퍼가 결합한 형태로 호주인 고객 비율이 50%이상입니다.<br>
편의점의 특성상 높은 마진과 쉬운 운영이 장점입니다.<br>
<br>
HTML
content = post.build_content(:body => body)
post.price = "$149,000+SAV"
post.address = "Westend, Brisbane, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=59"
Image.create(:source_url => "http://www.qoq.com.au/_data/property/59_20120702141927.jpg", :link_to_url => link_url).attached_to(post)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "시티 유명 헤어샵")
body = <<-HTML
시티 좋은 자리에 위치해 4년 이상을 영업해온 유명 헤어샵입니다.<br/>
항상 많은 단골들이 예약하고 주변에 더욱 많은 오피스들이 늘어날 예정이라 잠재력 또한 풍부합니다.<br/>
전화주시면 바로 보실 수 있습니다.<br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$120,000 Neg"
post.address = "Brisbane City, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=58"
Image.create(:source_url => "http://www.qoq.com.au/_data/property/58_20120702140942.jpg", :link_to_url => link_url).attached_to(post)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "써니뱅크힐스 알찬 스시집")
body = <<-HTML
써니뱅크 힐즈 쇼핑센터 내에 위치한 알찬 스시집입니다. <br/>
불경기에도 기복없이 항상 일정이상의 매출을 내는 스시 비즈니스를 놓치지 마세요. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$99,000"
post.address = "Sunnybank Hills, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=57"
Image.create(:source_url => "http://www.qoq.com.au/_data/property/57_20120702135809.jpg", :link_to_url => link_url).attached_to(post)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Baskin Robbins 아이스크림")
body = <<-HTML
아이스크림의 대명사 베스킨라빈스입니다. <br/>
브리즈번 북쪽에 위치하여 로컬 단골들의 꾸준한 사랑을 받는 곳입니다. <br/>
힘든 주방일 없이 안정적으로 운영하고 싶으신 분들께 강력 추천합니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$120,000"
post.address = "Strathpine, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=56"
Image.create(:source_url => "http://www.qoq.com.au/_data/property/56_20120702133840.jpg", :link_to_url => link_url).attached_to(post)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "시티, Cafe+Bar+한국음식")
body = <<-HTML
브리즈번 시티에서 성공적으로 오랫동안 운영되어 온 카페입니다. <br/>
아침 커피 손님부터 점심, 저녁, 술손님까지 꾸준하게 많은 단골을 보유하여 월 $10,000이상의 순이익을 기록하고 있습니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$250,000+SAV"
post.address = "Brisbane City, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=55"
Image.create(:source_url => "http://www.qoq.com.au/_data/property/55_20120702131527.jpg", :link_to_url => link_url).attached_to(post)
Image.create(:source_url => "http://www.qoq.com.au/_data/property/_20120702131614.jpg", :link_to_url => link_url).attached_to(post)
Image.create(:source_url => "http://www.qoq.com.au/_data/property/_20120702131635.jpg", :link_to_url => link_url).attached_to(post)


