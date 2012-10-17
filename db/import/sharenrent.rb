TopFeedList.category_feed(Accommodation.name).destroy_all
Accommodation.destroy_all

boards = Sharenrent.all
boards.each do |board|
  subject = Okiconv.euckr_to_utf8(board.bbs_title)
  post = Accommodation.find_by_subject(subject)
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
  category = Accommodation::Categories[:share]
  subject = "[" + b_category + "] " + subject
  post = Accommodation.new(:subject => subject, :category => category, :valid_until => expiry)
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
  puts "Saved. #{post.id}"
end
