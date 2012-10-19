# -*- coding: utf-8 -*-
require 'db/import/import_helper'

TopFeedList.category_feed(BuyAndSell.name).destroy_all
BuyAndSell.destroy_all

boards = Sellnbuy.all
boards.each do |board|
  subject = Okiconv.euckr_to_utf8(board.bbs_title)
  post = BuyAndSell.find_by_subject(subject)
  post.destroy if post.present?
  
  user_name = Okiconv.euckr_to_utf8(board.bbs_name)
  user = add_user(user_name)
  
  expiry_day = SystemSetting.first.post_expiry_length
  expiry = board.bbs_date + expiry_day.days
  puts "expiry: #{expiry}"
  b_category = Okiconv.euckr_to_utf8(board.b_category)
  puts "b_category: #{b_category}"
  body = Okiconv.euckr_to_utf8(board.bbs_review)
  if b_category.eql?('팝니다')
    category = BuyAndSell::Categories[:sell]
  else
    category = BuyAndSell::Categories[:buy]
  end
  post = BuyAndSell.new(:subject => subject, :category => category, :valid_until => expiry)
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



