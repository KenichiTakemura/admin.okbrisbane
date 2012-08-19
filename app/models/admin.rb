class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one :mypage, :as => :mypagable, :class_name => "Mypage", :dependent => :destroy
  has_many :role, :as => :rolable, :class_name => "Role", :dependent => :destroy
  
  after_create :create_mypage, :init_role

  def create_mypage
    logger.info("User created: " << self.to_s)
    m = Mypage.create()
    m.update_attribute(:mypagable, self)
  end
  
  def init_role
    [:p_job,:p_buy_and_sell,:p_well_being].each do |page|
    role = Role.new(:role_name => Style.page(page), :role_value => Role::R[:user_all] | Role::R[:other_all] | Role::R[:group_all] )
    role.assign(self)
    end
  end
  
  def name
    "#{I18n.t("admin")} [#{self.email}]"
  end
  
end
