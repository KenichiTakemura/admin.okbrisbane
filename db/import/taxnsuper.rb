# -*- coding: utf-8 -*-
require 'db/import/import_helper'

TopFeedList.category_feed(Tax.name).destroy_all
Tax.destroy_all

admin = Admin.post_admin.first

def add_tax(subject,category,user,body,created_at)
  post = Tax.find_by_subject(subject)
  post.destroy if post.present?
  expiry_day = SystemSetting.first.post_expiry_length
  expiry = created_at + expiry_day.days
  post = Tax.new(:subject => subject, :category => category, :valid_until => expiry)
  post.created_at = created_at
  if category.eql?(Okvalue::ADMIN_POST_NOTICE)
    post.z_index = Okvalue::ADMIN_POST_NOTICE_Z_INDEX
  end
  content = post.build_content(:body => body)
  post.save
  content.save
  post.set_user(user)
  post
end

def add_comment(post,user,body,created_at)
  comment = Comment.new(:body => body)
  comment.created_at = created_at
  comment.subscribe_to(post, user)
end

subject = "개인 택스리턴에 대한 정의"
category = Okvalue::ADMIN_POST_NOTICE
html = <<-HTML
<div style="margin: 0cm 0cm 10pt">안녕하세요. Okbrisbane.com을 방문해 주셔서 감사합니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">개인 택스리턴의 정의에 대해 설명을 해 드리고자 합니다.</div>
<div style="margin: 0cm 0cm 10pt">개인 택스리턴을 한국말로 하면 종합 소득세 신고 입니다. 한 회계년도 동안에 버신 모든 소득을 정산하여 국세청에 보고 하는 절차로 이 과정에서 환급이 이루어 질지 아니면 세금을 더 내셔야 할지 결정이 됩니다. 호주의 세금은 누진세가 적용이 되기 때문에 다른 여러 복합적인 상황도 있겠지만 일반적으로 소득이 많으신 분들의 경우 환급액이 많이 줄어들게 됩니다. 그래서 학생이나 워킹비자 소지자들의 경우 환급액에 큰 의미를 두겠지만 다른 풀타임의 일을 가지고 계신 분들은 환급 보단 택스리턴 원래의 의미인 소득세 신고에 의미를 두셔야 합니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">개인 세금의 경우 호주 국세청에서는 기본적으로 DIY (do it yourself) 를 제공하고 있습니다. E-tax나 paper를 통해서 직접 개인 택스리턴을 진행하실수 있습니다. 하지만 많은 호주분들이나 호주에서 오래 거준하신 분들의 경우 개인이 직접 진행을 하시기 보다는 세무회계사를 통해서 진행을 하시는 경우가 많이 있습니다. <br>
<br>
이는 환급액이 늘리려는 이유 보다는 정확한 택스리턴을 진행을 하기 위함으로 추후 국세청이나 센터링크로 부터 발생할수 있는 문제점을 사전에 방지하기 위함 입니다. 영주권자 이상 의 경우 센터 링크로 부터 몇가지 혜택을 받고 계시는데 대부분의 경우 택스리턴후 소득이 센터링크에 자동으로 신고가 되어 정부 보조금이 책정이 됩니다. 개인이 택스리턴을 진행하다 문제가 발생이 되면 국세청에 세금을 추가로 납부를 하셔야 하고 또 센터링크로 부터 받은 over benefit 금액 역시 다시 센터링크에 납부를 하셔야 하는 문제가 발생하기 때문에 이를 방지 하고자 회계 세무사를 이용하는것 입니다. 물론 납세자 분들께서 놓치기 쉬운 공제조항에 대해 숙지를 하고 있기 때문에 세무사를 이용시 환급액을 좀 늘리실수도 있습니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">학생의 경우 제한된 근무시간이 있기 때문에 저소득층으로 분류되어 환급액이 많이 늘어나게 됩니다. 이런 경우 의료세 면제나 다른 기타 사항들을 놓치는 경우가 많이 있습니다. 이런 부분들은 세무사가 상담후 합법적인 테두리 안에서 최대 환급을 받아 드리도록 노력하니 세무사 이용을 추천 합니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;개인 택스리턴의 신청을 원하시거나 궁금한 점이 있으시면 07 3343 8558로 연락을 주시기 바랍니다.</div>
HTML

add_tax(subject,category,admin,html,Common.current_time)

subject = "세금 목적상 거주자의 정의"
category = Okvalue::ADMIN_POST_NOTICE
html = <<-HTML
<div style="margin: 0cm 0cm 10pt">안녕하세요. Okbrisbane.com을 방문해 주셔서 감사합니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">워킹비자 소지자분들의 이슈중 하나가 얼마나 세금을 환급 받을수 있느냐 일거라 생각이 듭니다. 안타깝게도 요즘 국세청에서 워킹 비자 소지자분들의 세금 환급에 대해 많은 규제를 하고 있습니다. 대부분의 경우 환급신청자의 거주자 형태때문에 문제가 일어나고 있습니다. 그럼 국세청에서 말하는 세금 목적상의 거주자에 대해 설명을 해 드리도록 하겠습니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">택스리턴시 환급을 받기 위해서는 거주자로 분류가 되어야 하는데 이유는 비거주자로 분류될 경우 기본 29%의 세금을 납부 하셔야 합니다. 거주자로 택스리턴시 호주는 누진세율이 적용되기 때문에 환급이 가능합니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">워킹 비자의 원래 목적은 호주에 단기체류를 목적으로 방문을 하고 여러군데 여행을 하시면서 영어도 배우고 가끔 케쥬얼로 일을 하는것에 목적이 있습니다. 그렇기 때문에 택스파일넘버 역시 비거주자로 정의가 되어 발급이 됩니다.&nbsp;그래서 워킹 비자 분들을 백팩커라고도 부르기도 합니다. &nbsp;그렇다고 모든 워킹비자가 비거주자로 분류되어 택스리턴시 비거주자로 신청을 해야 하는것은 아닙니다. 세무사와 상담후 거주자로 택스리턴이 가능할수 있습니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">거주자는 말 그대로 생활 패턴이 거주형태 이어야 합니다. 한 회계년도 동안에 한 장소에 183일 이상 거주를 하셨거나 하실 예정이어야 하고, 한 직장을 다니고 주소지가 여러군데가 아닌 한 군데 일 경우 거주자로 칭하고 있습니다. 만약 호주에 6개월 이상 거주하셨다고 하더라도 여러 농장에 다니면서 3개월은 QLD 에 있는 농장에서 또 2개월은 NSW에 있는 농장에서 또 다른 2개월은 VIC에 있는 공장에서 일을 하셨다고 하면 이는 거주자가 아닌 여행자 혹은 백팩커로 보기 때문에 국세청에서 말하는 거주자 라고 하기에는 힘듭니다. 처음 설명한 거주형태로 거주를 하셨다면 택스리턴시 거주자로 분류 환급을 받으실수 있습니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt"><a href="http://calculators.ato.gov.au/scripts/axos/axos.asp?CONTEXT=&amp;KBS=Resident.XR4&amp;go=ok">http://calculators.ato.gov.au/scripts/axos/axos.asp?CONTEXT=&amp;KBS=Resident.XR4&amp;go=ok</a></div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">위 링크는 국세청에서 제시한 거주자 테스트 입니다. 위 테스트를 해 보시면 본인이 거주자 인지 비거주자인지 알아 보실수 있습니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
<div style="margin: 0cm 0cm 10pt">위 사항에 궁금한 점이 있으시거나 택스리턴 진행을 원하시면 3345 3256으로 연락을 주시기 바랍니다.</div>
<div style="margin: 0cm 0cm 10pt">&nbsp;</div>
HTML

add_tax(subject,category,admin,html,Common.current_time)
#
subject = "회사도 관리 하시나요?"
user = add_user("사장")
category = Tax::Categories[:for_business]
html = <<-HTML
<p><br>
비지니스 고객도 관리 하는지 알고 싶네요.<br>
회사 이름이 어찌 되나요?</p>
HTML

post = add_tax(subject,category,user,html,Time.parse("2011-11-11 15:48:54"))
user = add_user("TAX")
html = <<-HTML
<p>안녕하세요. okbrisbane.com을 방문해 주셔서 감사합니다.<br>
<br>
물론 하고 있고 비지니스 고객 관리 전문 회계법인 입니다.지금 회사 리뉴얼 중인 관계로 조만간 새로운 회사 이름으로 찾아 뵙겠습니다. 궁금한점이 있으시면 3345 3256 으로 연락을 주십시요. 지금 회계 상담 말고도 밥률 이민에 관해서도 분야의 전문가들 분께서 무료 상담을 제공 하고 계십니다.. 만약 도움이 필요하시면 3345 3256 으로 연락을 주셔서 상담 예약을 해 주시기 바랍니다.<br>
<br>
감사합니다.</p>
HTML
add_comment(post,user,html,Time.parse("2011-11-11 15:53:44"))
#
subject = "신청할려 하는데 수수료은요?"
user = add_user("김영길")
category = Tax::Categories[:for_personal]
html = <<-HTML
<p>수수료 얼마에요?<br>
<br>
신문에 다른데는 30불로 나오는뎅..</p>
HTML

post = add_tax(subject,category,user,html,Time.parse("2011-11-16 17:24:08"))
user = add_user("TAX")
html = <<-HTML
<p>안녕하세요. okbrisbane을 방문해 주셔서 감사합니다.<br>
<br>
택스리턴 기간내 신고는 from $77 입니다.<br>
의료세 신청시 추가 $22, 만약 저희회사 trust 이용시&nbsp;(환급액에서 수수료 제외) &nbsp;$11 추가 비용이 발생이 됩니다.<br>
<br>
조기 택스리턴의 경우 from $99 입니다. 추가 내역은 위와 동일합니다.<br>
<br>
자세한 사항은 3345-3256 으로 연락을 주시기 바랍니다.<br>
<br>
감사합니다.</p>
HTML
add_comment(post,user,html,Time.parse("2011-11-16 17:42:17"))

#
subject = "밀린 gst 신고해야 합니까?"
user = add_user("사장님")
category = Tax::Categories[:for_business]
html = <<-HTML
<div id="ct" style="font-size: 14px; line-height: 1.6; border: 0px solid red; word-break: break-all;" align="justify">수고 많습니다.<br>
<br>
제가 gst가 밀렸습니다. 이거 신고해야 합니까? 회사를 정리하면 상관 없습니까?<br>
<br>
답변 주시면 감사하겠습니다.&nbsp;</div>
HTML

post = add_tax(subject,category,user,html,Time.parse("2011-11-25 16:11:43"))
user = add_user("TAX")
html = <<-HTML
<p>안녕하세요. okbrisbane.com을 방문해 주셔서 감사합니다.<br>
<br>
결론부터 말씀 드리겠습니다. 정산 하셔야 합니다. 개인 사업자의 경우 사업체와 개인을 틀린 존재로 보는것이 아니라 하나로 보기때문에 사업체가 가진 부채역시 개인의 빚으로 간주를 하게 됩니다. 만약 사업체 형태가 회사일 경우라고 하더라고 지금현재 가지고 있는 국세청에 대한 빚 역시 public officer 혹은 사업체의 대표이사가 책임져야 합니다. <br>
<br>
일단 신고를 하시게 되면 늦게 신고한 BAS에 대한 벌금은 case by case로 국세청에서 부과를 하게 됩니다. 모든 결정은 국세청에서 하기 때문에 결과가 나오기 전에 저희가 이 부분에 대해 확답을 드릴수가 없습니다.<br>
<br>
올 2월 부터 국세청에서 밀린 세금에 대해 납부를 하라고 강하게 나오고 있습니다. 일단 BAS 신고를 하시고 개인의 사정에 맞게 국세청에 payment plan을 설명후 차근히 빚을 갚는게 가장 좋은 방법입니다. <br>
<br>
좀더 자세한 내용이나 상담을 원하시면 okbribane에 연락을 하셔서 저희와 상담 예약을 해 주시기 바랍니다.<br>
okbrisbane.com 3345 3256<br>
<br>
<br>
감사합니다.<br>
<br>
&nbsp;</p>
HTML
add_comment(post,user,html,Time.parse("2011-11-25 16:27:02"))
