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

TopFeedList.category_feed(Job.name).destroy_all
Job.destroy_all

boards = BoardGuin.all
boards.each do |board|
  subject = Okiconv.euckr_to_utf8(board.bbs_title)
  post = Job.find_by_subject(subject)
  post.destroy if post.present?
  
  user_name = Okiconv.euckr_to_utf8(board.bbs_name)
  
  user = User.find_by_user_name(user_name)
  user.destroy if user.present?
  user = User.where(:reset_password_token => user_name).first
  if user
    puts "#{user} found."
  else
    puts "#{user_name} not found."
    user = User.new(:email => "#{Common.uniqe_token}@okbrisbane.com", :password => Okvalue::DEFAULT_PASSWORD, :password_confirmation => Okvalue::DEFAULT_PASSWORD, :user_name => user_name, :is_special => false, :confirmed_at => Common.current_time)
    user.save
  end
  expiry_day = SystemSetting.first.post_expiry_length
  expiry = board.bbs_date + expiry_day.days
  puts "expiry: #{expiry}"
  b_category = Okiconv.euckr_to_utf8(board.b_category)
  puts "b_category: #{b_category}"
  body = Okiconv.euckr_to_utf8(board.bbs_review)
  if b_category.eql?('구인')
    category = Job::Categories[:seek]
  else
    category = Job::Categories[:hire]
  end
  post = Job.new(:subject => subject, :category => category, :valid_until => expiry)
  post.created_at = board.bbs_date
  if user_name.eql?("admin")
    post.category = Okvalue::ADMIN_POST_NOTICE
    post.valid_until = Common.current_time + expiry_day.days
    post.z_index = Okvalue::ADMIN_POST_NOTICE_Z_INDEX
    post.created_at = Common.current_time
  end
  content = post.build_content(:body => body)
  post.save
  if user_name.eql?("admin")
    admin = Admin.post_admin.first
    post.set_user(admin)
  else
    post.set_user(user)
  end
  content.save
end



