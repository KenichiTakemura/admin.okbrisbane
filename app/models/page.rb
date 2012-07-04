class Page < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  PAGES = Hash.new
  PAGES[:top] = "TOP PAGE"
  PAGES[:signin] = "SIGNIN PAGE"
  PAGES[:signup] = "SIGNUP PAGE"
  PAGES[:signout] = "SIGNOUT PAGE"
  PAGES[:job] = "JOB PAGE"
  PAGES[:buy_and_sell] = "BUY AND SELL PAGE"
  
  has_many :banner, :as => :bannered, :dependent => :destroy
end
