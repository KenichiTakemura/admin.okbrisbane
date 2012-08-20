class LegalServicesController < PostsController

  @@management_path = "sales_managements"  
  def show
    _show(Law)
  end
    
  def create
    _create(Law, :law)
  end
  
  def edit
    _edit(Law)
  end
  
  def update
    _update(Law, :law)
  end
  
end