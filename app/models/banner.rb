class Banner < ActiveRecord::Base
  attr_accessible :place
  belongs_to :bannered, :polymorphic => true
  
  def paged_in(page)
    update_attribute(:bannered, page)
  end
  
end
