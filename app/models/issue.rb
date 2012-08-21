class Issue < ActiveRecord::Base

  attr_accessible :description, :body, :status, :category
  belongs_to :issued_by, :polymorphic => true

  has_many :attachment, :as => :attached, :class_name => 'Attachment', :dependent => :destroy
  has_many :comment, :as => :commented, :class_name => 'Comment', :dependent => :destroy
  
  after_initialize :set_default
  
  validates_presence_of :description, :message => I18n.t('must_be_filled')
  
  def set_default
    self.status ||= Okvalue::ISSUE_NEW  
  end
  
  def assigned
    update_attribute(:status, Okvalue::ISSUE_ASSIGNED)
  end

  def on_qa
    update_attribute(:status, Okvalue::ISSUE_ONQA)
  end

  def closed
    update_attribute(:status, Okvalue::ISSUE_CLOSED)
  end
  
  def reopen
    update_attribute(:status, Okvalue::ISSUE_REOPEN)
  end
  
  def status_list
    list = Array.new
    list.push([I18n.t(Okvalue::ISSUE_NEW),Okvalue::ISSUE_NEW])
    list.push([I18n.t(Okvalue::ISSUE_ASSIGNED),Okvalue::ISSUE_ASSIGNED])
    list.push([I18n.t(Okvalue::ISSUE_ONQA),Okvalue::ISSUE_ONQA])
    list.push([I18n.t(Okvalue::ISSUE_CLOSED),Okvalue::ISSUE_CLOSED])
    list.push([I18n.t(Okvalue::ISSUE_REOPEN),Okvalue::ISSUE_REOPEN])
    list
  end
  
  def category_list
    list = Array.new
    list.push([I18n.t(Okvalue::ISSUE_BUG),Okvalue::ISSUE_BUG])
    list.push([I18n.t(Okvalue::ISSUE_FEATURE_REQUEST),Okvalue::ISSUE_FEATURE_REQUEST])
    list.push([I18n.t(Okvalue::ISSUE_IMPROVEMENT),Okvalue::ISSUE_IMPROVEMENT])
    list
  end
  
end
