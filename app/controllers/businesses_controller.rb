class BusinessesController < PostsController

  @@management_path = "sales_managements"  
  
  def create
    _create(Business, :business)
  end
  
  def update
    _update(Business, :business)
  end
  
end
