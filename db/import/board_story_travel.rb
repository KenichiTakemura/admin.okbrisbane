# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# +-------------+--------------+------+-----+---------+----------------+
# | Field       | Type         | Null | Key | Default | Extra          |
# +-------------+--------------+------+-----+---------+----------------+
# | number      | int(11)      | NO   | PRI | NULL    | auto_increment |
# | bbs_name    | varchar(30)  | NO   | MUL |         |                |
# | bbs_pass    | varchar(30)  | NO   |     |         |                |
# | bbs_email   | varchar(100) | NO   |     |         |                |
# | bbs_title   | varchar(100) | NO   | MUL |         |                |
# | bbs_img     | varchar(50)  | NO   |     |         |                |
# | bbs_review  | text         | NO   |     | NULL    |                |
# | bbs_count   | int(11)      | NO   |     | 0       |                |
# | bbs_date    | datetime     | YES  |     | NULL    |                |
# | groups      | int(11)      | NO   | MUL | 0       |                |
# | seq         | int(11)      | NO   | MUL | 0       |                |
# | depth       | int(11)      | NO   |     | 0       |                |
# | bbs_etc1    | varchar(100) | NO   |     |         |                |
# | bbs_etc2    | int(5)       | NO   |     | 0       |                |
# | bbs_etc3    | varchar(50)  | NO   |     |         |                |
# | bbs_etc4    | int(5)       | NO   |     | 0       |                |
# | bbs_etc5    | varchar(50)  | NO   |     |         |                |
# | bbs_attach2 | varchar(100) | NO   |     |         |                |
# | bbs_attach3 | varchar(100) | NO   |     |         |                |
# | bbs_etc6    | varchar(100) | NO   |     |         |                |
# | bbs_etc7    | varchar(100) | NO   |     |         |                |
# | phone       | varchar(150) | NO   |     |         |                |
# | hphone      | varchar(150) | NO   |     |         |                |
# | address     | text         | NO   |     | NULL    |                |
# | zip         | varchar(10)  | NO   |     |         |                |
# | select1     | int(10)      | NO   | MUL | 0       |                |
# | select2     | int(10)      | NO   | MUL | 0       |                |
# | select3     | varchar(100) | NO   |     |         |                |
# | radio1      | varchar(100) | NO   |     |         |                |
# | radio2      | varchar(100) | NO   |     |         |                |
# | radio3      | varchar(100) | NO   |     |         |                |
# | text1       | text         | NO   |     | NULL    |                |
# | text2       | text         | NO   |     | NULL    |                |
# | text3       | text         | NO   |     | NULL    |                |
# | gou_number  | varchar(50)  | NO   | MUL |         |                |
# | delivery    | int(1)       | NO   |     | 0       |                |
# | money_in    | int(1)       | NO   |     | 0       |                |
# | total_price | int(100)     | NO   |     | 0       |                |
# | b_category  | varchar(150) | NO   | MUL |         |                |
# | reply_stats | int(1)       | NO   |     | 0       |                |
# | write_ip    | varchar(100) | NO   |     |         |                |
# | org_writer  | varchar(100) | NO   | MUL |         |                |
# | view_lock   | int(1)       | NO   |     | 0       |                |
# | notice      | int(1)       | NO   |     | 0       |                |
# | bbs_id      | varchar(100) | NO   | MUL |         |                |
# +-------------+--------------+------+-----+---------+----------------+


TopFeedList.category_feed(MotorVehicle.name).destroy_all
MotorVehicle.destroy_all

User.find_by_email("ifhm@naver.com").destroy
post_user = User.create(:email => "ifhm@naver.com", :password => Okvalue::DEFAULT_PASSWORD, :password_confirmation => Okvalue::DEFAULT_PASSWORD, :user_name => "변희민", :is_special => false, :confirmed_at => Common.current_time)


def add_a_car(subject, bbs_date, user, body, images)
  expiry_day = SystemSetting.first.post_expiry_length
  expiry = bbs_date + expiry_day.days
  category = MotorVehicle::Categories[:used_car]
  post = MotorVehicle.new(:subject => subject, :category => category, :valid_until => expiry)
  post.created_at = bbs_date
  content = post.build_content(:body => body)
  post.save
  post.set_user(user)
  content.save
  images.each do |image|
    image.attached_to_by(post,user)
  end
end

subject = "'99 미쯔비시 베라다"
bbs_date = "2011-10-31 13:22:54"
html = <<-HTML
<p>99년 스포츠세단 미쯔비시 베라다 최상급모델팝니다</p>
<p>사양은<br />
쿠르즈컨트롤 / 시티체인져 시티6개삽입가능 / 17인치 사제휠 / 뒷날개 / 리모콘키 / 센트럴락 / 자동온도조절 튜닝스포츠마후라등등</p>
<p>검정색이구요 18만뛰었습니다. 차는 말할것없이 엄청잘나가구요. 검정색이라 정말 멋있어요 ㅎㅎ</p>
<p>년식이있어서 새차같이 꺠끗하지는 않지만 보면 만족하실겁니다^^</p>
<p>주행해보시면아시겠지만 기아 올라갈때 느낌 정말 좋습니다.</p>
<p>rwc포함한가격 5천불정도생각합니다.<br />
아진짜 차 정말 멋집니다<br />
0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car1-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "99년 팔콘 팝니다rwc+레지내년6월"
bbs_date = "2011-10-31 13:24:34"
html = <<-HTML
<p>99년 팔콘 팝니다rwc+레지내년6월</p>
<p>가격 2800불이구요<br />
외관은 년식이있다보니 새차같지는 않구요<br />
그냥 농장용으로나 공장용으로 괜찮은 차라고 생각합니다</p>
<p>rwc하면서 800불이상 수리비들여서 해놨구요<br />
레지값만해도 600불정도 된다고 보심됩니다.</p>
<p>타이밍벨트없는 타입의 엔진이라 키로수걱정없이 타실수있구요<br />
21만키로 주행있구요~</p>
<p>연락주세요 <br />
0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car2-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "03년식 캠리"
bbs_date = "2011-10-31 13:25:14"
html = <<-HTML
<p>03년식 캠리팝니다</p>
<p>15만뛰었구요<br />
모델은 알티즈 스포츠입니다<br />
뒤에 날개 달려있고 알로이휠 전자동윈도우 리모콘키 센트럴락 옵션포함되있는 모델입니다</p>
<p>15만뛰었구요 엔진 미션상태는 보시면 만족하실듯합니다.</p>
<p>차 정말 잘나가고 정숙하며 좋습니다^^</p>
<p>rwc당연히 받아드리구요<br />
타이어 상태 아주 좋습니다</p>
<p>귀국해서 급하게 파는차가 아니라 완전싸게는 못드려요;; 하지만 어느정도 내고는 생각하고 있습니다</p>
<p>레지는 12월까지구요<br />
rwc는 오지정비소에서 받아드리겠습니다</p>
<p>0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car3-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "'99 포드 팔콘"
bbs_date = "2011-10-31 13:26:45"
html = <<-HTML
<p>막16만된 99년식팔콘팝니다 rwc+레지내년3월<br />
레지내년3월까지구요<br />
이제 16만키로 뛰었습니다<br />
내관외관 모두 좋구요<br />
에어콘빵빵하게 잘나옵니다<br />
차 5명이 타도 잘나갑니다<br />
오지정비소에서 rwc받아놨구요 명의이전도와드릴꼐요<br />
3천800불에 드리겠습니다<br />
차 정말꺠끗하고 좋습니다</p>
<p>0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car4-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "99년 ford falcon"
bbs_date = "2011-10-31 13:29:50"
html = <<-HTML
21만키로주행<br />
rwc완료<br />
고속주행 정숙합니다<br />
차깨끗하고 4000cc 차라 잘나가고 이코노미기능잇어서 연비 괜찮아요<br />
<br />
0403 551 149
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car5-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "98 현대 엑셀"
bbs_date = "2011-10-31 13:33:18"
html = <<-HTML
연비 좋은 현대 엑셀팝니다<br />
<br />
15만키로 뛰었구요 rwc완료입니다<br />
가격은!! 2999불!!!<br />
작은차라 힘은 좀 딸립니다 하지만 연비는 최강입니다<br />
출퇴근용으로 좋구요 내관 외관 모두 꺠끗하구 <br />
키로수 가격대비 괜찮은차라 생각합니다<br />
<br />
아 레지는 내년 2월까지구요<br />
0403 551 149
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car6-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "97 코모도르"
bbs_date = "2011-10-31 13:36:27"
html = <<-HTML
97년식<br />
24만키로주행<br />
사제 오디오 / 에어컨 둘다 빵빵합니다.<br />
차잘나가구요 넓고 뒷자석 에어컨 달려있어서 여럿이타도 좋습니다<br />
호주 국민차라 부품도 많구 차 예쁩니다~<br />
rwc포함 3300불생각합니다<br />
<br />
0403 551 149
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car7-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "'99 팔콘 a급"
bbs_date = "2011-11-04 08:33:09"
html = <<-HTML
<p>99년 팔콘 상태a급 레지 내년 9월까지</p>
<p>24만뛴 깨끗한 팔콘팝니다<br />
rwc 완료 되었구요 (오지샵)<br />
레지 내년 9월까지입니다<br />
레지값만 700불되네요</p>
<p>보시면 아시겟지만 외부 내부 정말 꺠끗합니다 뒤에 날개도 달려있어 멋지구요 ㅎㅎ</p>
<p>엔진상태나 미션상태나 훌륭합니다</p>
<p>타이밍벨트 없는차라 걱정없이 타실수있습니다</p>
<p>0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car8-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)

subject = "7인승 페밀리카 크라이슬러 그랜드 보야지팝니다"
bbs_date = "2011-11-09 10:39:44"
html = <<-HTML
<p>7인승 페밀리카 크라이슬러 그랜드 보야지팝니다</p>
<p>98년식이구요<br />
22만키로 뛰었습니다<br />
전체적으로 꺠끗한편이구요<br />
7인승 승합차입니다<br />
차 부드럽게 잘나가구요 <br />
뒷자석 공구없이 손쉽게 분리되어 짐옴기는데도 유용합니다<br />
레지는 12월까지구요<br />
rwc 없이 구매하시면 3800불! rwc포함 4800불해 팔아요<br />
시원시원하게 구매하시면 시원하게 네고도 해드리겠습니다</p>
<p>연락주세요</p>
<p>0403 551 149</p>
HTML
images = Array.new
images.push(Image.create(:avatar => File.new("db/import/car9-1.jpg")))
add_a_car(subject, Time.parse(bbs_date),post_user,html,images)                                         