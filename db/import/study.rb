TopFeedList.category_feed(Study.name).destroy_all
Study.destroy_all

admin = Admin.post_admin.first

expiry = Common.current_time + 60.days

post = Study.new(:subject => 'JJ 유학센터', :category => Study::Categories[:for_study_overseas], :valid_until => expiry)
image = Image.new(:avatar => File.new("db/import/jj_1.jpg"))
post.save
image.attached_to_by(post, admin)
post.set_user(admin)
html = <<-HTML
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font face="Malgun Gothic"><font size="2"><span lang="KO">안녕하세요</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font face="Malgun Gothic"><font size="2"><span lang="KO">믿음과 신뢰를 바탕으로 유학준비생 및 유학생분들께 항상 최고의 서비스를 드리고자 노력하는</span> JJ <span lang="KO">유학센터 입니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font face="Malgun Gothic"><font size="2"><span lang="KO">세계가 필요로 하는 글로벌인재가 되려고 준비하는 모든 분들께</span> JJ <span lang="KO">유학센터는 그 시작이 되고자 합니다</span>. <o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font face="Malgun Gothic"><font size="2"><span lang="KO">호주의 유학시장이 개방된</span> 1987<span lang="KO">년 이후 많은 학생들이 호주로의 유학을 선택</span>, <span lang="KO">실행했고</span>, JJ <span lang="KO">유학센터 역시 지금까지 조기유학</span>, <span lang="KO">어학연수</span>, <span lang="KO">직업전문과정 및 정규대학 등으로 많은 유학생을 배출하였고 이제 호주유학 및 이민의 전문가 집단으로 인정받고 있습니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font face="Malgun Gothic"><font size="2"><span lang="KO">인터넷의 발달로 인한 정보의 홍수 속에서 제대로 된 정보를 선택하기는 쉽지 않습니다</span>. <span lang="KO">그러나</span> JJ <span lang="KO">유학센터는 네이버카페</span> &ndash; <span lang="KO">호주길라잡이</span> (</font></font><a href="http://cafe.naver.com/gooddaymate"><font color="#0000ff" size="2" face="Times New Roman">http://cafe.naver.com/gooddaymate</font></a><font size="2"><font face="Malgun Gothic">) <span lang="KO">를 통해 가장 최신의</span>, <span lang="KO">가장 믿을 수 있는 정보를 드리기 위해 오늘도 최선의 노력을 하고 있습니다</span>. <o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">JJ <span lang="KO">유학센터는 호주본사를 포함 서울 및 부산에 프랜차이즈가 아닌</span> 100% <span lang="KO">직영으로 운영이 되고 있는 회사로 유학의 준비부터 유학을 마치는 순간까지 항상 여러분 곁에 남아 있을 것 입니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic"><span lang="KO">유학원의 수는 무수히 많습니다</span>. <span lang="KO">그러나 유학을 준비하는 모든 학생 한 명</span>, <span lang="KO">한 명에게 최적의 정보를 제공하고 학생들이 올바른 진로선택을 할 수 있게 도와 줄 수 있는 전문가 집단은 그리 많지 않습니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">JJ <span lang="KO">유학센터의 브리스번 본사 직원들은 호주 정규대학 졸업자로 구성이 되어져 있습니다</span>. <span lang="KO">따라서 유학생이 가장 필요로 하는 것이 무엇인지 어느 누구보다 잘 알고 있다고 자부합니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">JJ <span lang="KO">유학센터는 가장 큰 유학원이 아닌 가장 믿을 수 있는 유학원이 되기 위해 오늘도 노력하고 있습니다</span>.<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><o:p><font size="2" face="Malgun Gothic">&nbsp;</font></o:p></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">Location:<span style="mso-tab-count: 2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Suite 2E, Level 2, 235 Edward Street, Brisbane, Q 4000<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">Telephone:<span style="mso-tab-count: 2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>07 3211 0077<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">Internet Phone:<span style="mso-tab-count: 2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>070 8620 2118<o:p></o:p></font></font></p>
<p style="margin: 0cm 0cm 0pt" class="MsoNormal"><font size="2"><font face="Malgun Gothic">Fax:<span style="mso-tab-count: 3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>07 3211 0079<o:p></o:p></font></font></p>
HTML
content = post.build_content(:body => html)
content.save

