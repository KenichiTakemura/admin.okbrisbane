class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_special
  
  has_one :mypage, :as => :mypagable, :class_name => "Mypage", :dependent => :destroy
  has_many :role, :as => :rolable, :class_name => "Role", :dependent => :destroy
  has_many :job, :as => :posted_by, :class_name => 'Job', :dependent => :destroy
  has_many :buy_and_sell, :as => :posted_by, :class_name => 'BuyAndSell', :dependent => :destroy
  has_many :well_being, :as => :posted_by, :class_name => 'WellBeing', :dependent => :destroy
  has_many :comment, :as => :commented_by, :class_name => 'Comment', :dependent => :destroy
  has_many :attachment, :as => :attached_by, :class_name => 'Attachment', :dependent => :destroy
  has_many :image, :as  => :attached_by, :class_name => 'Image', :dependent => :destroy
  has_many :issue, :as => :posted_by, :class_name => "Issue", :dependent => :nullify
  has_many :admin_notice, :as  => :posted_by, :class_name => 'AdminNotice', :dependent => :destroy

  after_create :create_mypage, :init_role
  
  scope :post_admin, where("email = ?", Okvalue::POST_ADMIN)

  def create_mypage
    logger.info("User created: " << self.to_s)
    m = Mypage.create()
    m.update_attribute(:mypagable, self)
  end
  
  def init_role
    [:p_job,:p_buy_and_sell,:p_well_being].each do |page|
      role = Role.new(:role_name => Style.page(page), :role_value => Role::R[:all] )
      role.assign(self)
    end
    Style.admin_roles.each do |key,value|
      role = Role.new(:role_name => value,  :role_value => Role::R[:all] )
      role.assign(self)
    end
  end
  
  def can_view_for?(o)
    logger.debug("can_view_for? #{o}")
    self.role.each do |role|
      return true if role.role_name.eql?(Style.admin_role(o)) && role.has_role?(Role::R[:user_r])
    end
    false
  end
  
  def disable_role(o)
    self.role.each do |role|
      role.role_name.eql?(Style.admin_role(o)) && role.disable_role
    end
  end
  
  def name
    "#{I18n.t("admin")} [#{self.email}]"
  end
  
  def unattached_image
    Image.where("attached_by_id = ? AND attached_id is NULL AND write_at is not NULL", self.id)
  end

  def unattached_attachment
    Attachment.where("attached_by_id = ? AND attached_id is NULL AND write_at is not NULL", self.id)
  end
  
  def to_s
    "#{id} #{email} #{is_special}"
  end
end