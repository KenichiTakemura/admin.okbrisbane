# -*- coding: utf-8 -*-
def add_user(user_name)
  if user_name.eql?("admin")
    return Admin.post_admin.first
  end
  user = User.find_by_user_name(user_name)
  if !user.present?
    user = User.where(:reset_password_token => user_name).first
    if user.present?
      puts " #{user} found."
    else
      user = User.new(:email => "#{Common.uniqe_token}@okbrisbane.com", :password => Okvalue::DEFAULT_PASSWORD, :password_confirmation => Okvalue::DEFAULT_PASSWORD, :user_name => user_name, :is_special => false, :confirmed_at => Common.current_time)
      user.save
    end
  end
  user
end

def import_data(legacyModel, newModel)
  TopFeedList.category_feed(newModel.name).destroy_all
  newModel.destroy_all

  fd = File.open("db/export/#{legacyModel}.t", "r:utf-8")
  lines = fd.readlines
  lines.each_with_index do |line,x|
    item = line.split("#")
    subject = ""
    user_name = ""
    body = ""
    File.open(item[1], "r:utf-8") do |f|
      subject << f.read
    end
    subject.chomp!
    post = newModel.find_by_subject(subject)
    post.destroy if post.present?
    File.open(item[2], "r:utf-8") do |f|
      user_name << f.read
    end
    user_name.chomp!
    user = add_user(user_name)
    created_at = item[3]
    expiry = item[4]
    b_category = item[5]
    File.open("#{item[6].gsub!(/\s/, "")}") do |f|
      body << f.read
    end
    body.chomp!
    case newModel.name
    when "Job"
      if b_category.eql?('구인')
        category = Job::Categories[:seek]
      else
        category = Job::Categories[:hire]
      end
    when "BuyAndSell"
      if b_category.eql?('팝니다')
        category = BuyAndSell::Categories[:sell]
      else
        category = BuyAndSell::Categories[:buy]
      end
    when "Accommodation"
      category = Accommodation::Categories[:share]
    else
    raise "Category error"
    end
    post = newModel.new(:subject => subject, :category => category, :valid_until => expiry)
    post.created_at = created_at
    puts user_name
    if user_name.eql?("admin")
      post.category = Okvalue::ADMIN_POST_NOTICE
      expiry_day = SystemSetting.first.post_expiry_length
      post.valid_until = Common.current_time + expiry_day.days
      post.z_index = Okvalue::ADMIN_POST_NOTICE_Z_INDEX
      post.created_at = Common.current_time
    end
    content = post.build_content(:body => body)
    post.save
    post.set_user(user)
    content.save
  end

end
