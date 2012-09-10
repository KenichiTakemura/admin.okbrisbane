# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TopFeedList.category_feed(Business.name).delete_all
Business.destroy_all
Image.where("attached_type = 'Business'").destroy_all
Attachment.where("attached_type = 'Business'").destroy_all

admin = Admin.find_by_email(Okvalue::POST_ADMIN)

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
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/61_20120725100055.jpg", :link_to_url => link_url).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120725100201.jpg", :link_to_url => link_url).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120725100300.jpg", :link_to_url => link_url).attached_to_by(post, admin)
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
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/59_20120702141927.jpg", :link_to_url => link_url).attached_to_by(post, admin)
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
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/58_20120702140942.jpg", :link_to_url => link_url).attached_to_by(post, admin)
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
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/57_20120702135809.jpg", :link_to_url => link_url).attached_to_by(post, admin)
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
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/56_20120702133840.jpg", :link_to_url => link_url).attached_to_by(post, admin)
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
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/55_20120702131527.jpg", :link_to_url => link_url).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/_20120702131614.jpg", :link_to_url => link_url).attached_to_by(post, admin)
Image.create(:write_at => post.write_at, :source_url => "http://www.qoq.com.au/_data/property/_20120702131635.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Toombul, 웬디스 아이스크림!")
body = <<-HTML
브리즈번 공항 근처 대형 쇼핑센터 Toombul에 웬디스 아이스크림 프랜차이즈입니다. <br/>
유동인구가 충분히 확보되어 있으며 호주인들에게 친숙한 맛의 아이스크림입니다. <br/>
소자본, 쉬운 영업을 찾는 분이라면 전화 주십시오. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$45,000Neg."
post.address = "Toombul, Brisbane, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=54"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/54_20120627101511.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Coopers Plains, 스낵바")
body = <<-HTML
써니뱅크 근처 쿠퍼스 플레인에 위치한 스낵바입니다. <br/>
샌드위치, 휘시앤칩스, 버거 등을 판매하며 무엇보다 저렴한 렌트가 장점입니다. <br/>
더불어 항상 사람들로 붐비는 공업단지에 위치해 많은 잠재력을 갖추고 있습니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$40,000WIWO"
post.address = "Coopers Plains, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=53"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/53_20120625131749.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "브리즈번의 홍대거리, 웨스트엔드 미용실")
body = <<-HTML
브리즈번의 떠오르는 젊음의 거리, 웨스트엔드 중 가장 번화가에 위치한 미용실입니다. <br/>
100% 호주인 로컬을 상대로 영업하고 있으며 모던한 인테리어 저렴한 렌트비로 좋은 수익이 나는 미용실입니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$89,000+STOCK"
post.address = "Westend, Brisbane QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=52"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/_20120625120705.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "런컨, 성업중인 치킨 & 피쉬")
body = <<-HTML
런컨 지역에서 성업중인 치킨 & 피쉬 가게입니다. <br/>
테이크어웨이, Dine-in 모두 가능합니다. <br/>
공격적인 마케팅으로 점차 매출이 오르는 중이며 입소문이 나 있는 가게입니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$139,000"
post.address = "Runcorn, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=51"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/51_20120625114740.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "시티인근 핫스팟, 피자레스토랑")
body = <<-HTML
항상 많은 사람이 찾는 식당가에 위치한 고급 피자레스토랑입니다. <br/>
호주인들이 절대 선호하는 메뉴, 넓은 매장 (좌석 80석)에 비즈니스의 잠재력을 확인하세요. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$150,000"
post.address = ""
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=50"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/50_20120625101942.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Logan근처, 대형마트 빅찬스")
body = <<-HTML
'Owner Finance 가능' <br/>
대형매장(385sqm)에 연매출 12Million을 상회하는 규모로 12년 오너 운영의 안정된 비즈니스입니다. <br/>
유통에 관심 있으셨던 분이라면 전화 주세요. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$298,000+Stock Neg."
post.address = "Logan, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=49"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/49_20120625100856.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "시티 최강 테이크어웨이")
body = <<-HTML
시티 좋은 자리에 위치해 상대적으로 저렴한 렌트비와 주 5일 영업만으로 월평균 순익 $8,000 (오너 한명이 일할 경우)을 꾸준하게 기록하고 있습니다. <br/>
깨끗한 인테리어와 많은 손님! <br/>
QOQ에서 강력 추천합니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$159,000"
post.address = "Brisbane city, QLD"
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=48"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/48_20120625093138.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Sushi프렌차이즈, 시티 인근")
body = <<-HTML
대형 쇼핑센터 속 독점 스시샵입니다. <br/>
스시 프랜차이즈로서 처음 비즈니스를 시작하시거나 스시에 대한 노하우가 없으셔도 쉽게 시작하실 수 있습니다. <br/>
저렴한 렌트비와 인건비가 절약되어 더욱 실속 있습니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$150,000 WIWO"
post.address = ""
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=46"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/46_20120622132535.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "이탈리아 레스토랑 & 카페")
body = <<-HTML
브리즈번 시티에서 차로 10분 거리. <br/>
분위기 좋은 인테리어에서 Italian Pizza와 에스프레소를 즐기는 것은 모든 이의 꿈입니다. <br/>
기복없는 매출과 저렴한 렌트비 역시 이 비즈니스를 꼭 지켜 보셔야 하는 이유입니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$119,000"
post.address = ""
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=45"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/45_20120622130432.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Fish & Chips, 브리즈번 북부지역")
body = <<-HTML
브리즈번 시티에서 차로 10분 거리에 위치한 Fish & Chips 가게입니다. <br/>
Coles를 끼고 있는 쇼핑센터에 로컬 주민까지 단골들의 사랑을 받는 가게로써 <br/>
쇼핑센터 앞 큰 아파트 단지가 개발중에 있어 더욱 큰 잡재력을 갖습니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$120,000"
post.address = ""
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=44"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/44_20120622123651.jpg", :link_to_url => link_url).attached_to_by(post, admin)
####
post = Business.new(:category => Business::Categories[:for_sale], :subject => "Eagle Boys Pizza Franchise")
body = <<-HTML
시티 인근 Suburb에 위치한 호주 전통 피자 프랜차이즈 이글보이즈입니다. <br/>
현재 오너가 직접 일을 하지 않고도 연수익 5만불 이상을 기록하고 있습니다. <br/>
 <br/>
HTML
content = post.build_content(:body => body)
post.price = "$270,000"
post.address = ""
post.valid_until = post_expiry
post.set_user(admin)
post.save
content.save
link_url = "http://www.qoq.com.au/korean/property/property_view.php?num=43"
Image.create(:write_at => post.write_at, :source_url => "http://qoq.com.au/_data/property/43_20120622121913.jpg", :link_to_url => link_url).attached_to_by(post, admin)
