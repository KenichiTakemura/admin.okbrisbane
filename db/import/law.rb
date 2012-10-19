# -*- coding: utf-8 -*-
require 'db/import/import_helper'

TopFeedList.category_feed(Law.name).destroy_all
Law.destroy_all

admin = Admin.post_admin.first

expiry = Common.current_time + 60.days

post = Law.new(:subject => 'Traffic_Accident_Acknowledge_Form', :category => Law::Categories[:for_traffic_accident], :valid_until => expiry)
post.save
attachment = Attachment.new(:avatar => File.new("db/import/1320383055-100.doc"))
attachment.attached_to_by(post, admin)
post.set_user(admin)
html = <<-HTML
<p>안녕하십니까? 변호사 주 광훈 입니다.</p>
<p>교통사고 발생 시 책임 소재의 불분명, 가해자의 사후 사고 부정 등으로 인하여 고통 받는 경우가 많으신 것 같아</p>
<p>간단하게 교통 사고 사건 인정서를 만들어 보았습니다.</p>
<p>불의의 교통 사고에 대비하여 Comprehensive Insurance(종합보험)에 꼭 가입하시기를 권유 드립니다. </p>
<p>여러모로 부족한 Form이지만 출력하신 후,</p>
<p>차량에 비치하시어 예기치 않았던 사고를 당하셨을 때 이용 하시기 바랍니다.</p>
<p><span style="color: #339966">\okbrisbane 회원 여러분의가정에 언제나 행복이 넘쳐나기를 기원드리겠습니다
</span></p>
HTML
content = post.build_content(:body => html)
content.save
