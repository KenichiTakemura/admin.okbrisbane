# -*- coding: utf-8 -*-
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  
  def description
    description =  "2012년 브리즈번 한글학교 교사모집합니다. ";
  end

  def body
    body = "2012년 브리즈번 한글학교 교사모집합니다. ";
  end

  def ok_admin
    admin_user = Admin.new(:email => "admin@okbrisbane.com", :password => "test", :password_confirmation => "test",  :is_special => true)
    admin_user.save
    Rails.logger.debug("Admin: #{admin_user}")
    admin_user
  end
  
end

