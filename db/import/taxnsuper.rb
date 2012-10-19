# -*- coding: utf-8 -*-
require 'db/import/import_helper'

TopFeedList.category_feed(Tax.name).destroy_all
Tax.destroy_all

def add_tax(number,category)
  board = Taxnsuper.find_by_number(number)
  if !board.present? 
    raise "Board Not found"
  end
  subject = Okiconv.euckr_to_utf8(board.bbs_title)
  user_name = Okiconv.euckr_to_utf8(board.bbs_name)
  user = add_user(user_name)
  body = Okiconv.euckr_to_utf8(board.bbs_review)
  post = Tax.find_by_subject(subject)
  post.destroy if post.present?
  expiry_day = SystemSetting.first.post_expiry_length
  expiry = board.bbs_date + expiry_day.days
  post = Tax.new(:subject => subject, :category => category, :valid_until => expiry)
  post.created_at = board.bbs_date
  if category.eql?(Okvalue::ADMIN_POST_NOTICE)
    post.valid_until = Common.current_time + expiry_day.days
    post.z_index = Okvalue::ADMIN_POST_NOTICE_Z_INDEX
    post.created_at = Common.current_time
  end
  content = post.build_content(:body => body)
  post.save
  content.save
  if category.eql?(Okvalue::ADMIN_POST_NOTICE)
    admin = Admin.post_admin.first
    post.set_user(admin)
  else
    post.set_user(user)
  end
  post
end

def add_comment(post,number)
  board = Taxnsuper.find_by_number(number)
  if !board.present? 
    raise "Board Not found"
  end
  user_name = Okiconv.euckr_to_utf8(board.bbs_name)
  user = add_user(user_name)
  body = Okiconv.euckr_to_utf8(board.bbs_review)
  comment = Comment.new(:body => body)
  comment.subscribe_to(post, user)
end

add_tax(1,Okvalue::ADMIN_POST_NOTICE)
add_tax(2,Okvalue::ADMIN_POST_NOTICE)
post = add_tax(11,Tax::Categories[:for_business])
add_comment(post,12)
post = add_tax(13,Tax::Categories[:for_personal])
add_comment(post,14)
post = add_tax(15,Tax::Categories[:for_personal])
add_comment(post,16)
post = add_tax(17,Tax::Categories[:for_business])
add_comment(post,18)