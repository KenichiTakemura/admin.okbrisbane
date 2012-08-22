class ImmigrationsController < PostsController
  
  @@management_path = "sales_managements"
    
  def create
    _create(Immigration, :immigration)
  end
  
  def update
    _update(Immigration, :immigration)
  end
  
end