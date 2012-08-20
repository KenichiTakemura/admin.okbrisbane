class ImmigrationsController < PostsController
  
  @@management_path = "sales_managements"
  
  def show
    _show(Immigration)
  end
    
  def create
    _create(Immigration, :immigration)
  end
  
  def edit
    _edit(Immigration)
  end
  
  def update
    _update(Immigration, :immigration)
  end
  
end