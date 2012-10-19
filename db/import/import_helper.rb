def add_user(user_name)
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