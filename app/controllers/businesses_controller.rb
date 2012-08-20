class BusinessesController < PostsController

  @@management_path = "sales_managements"  
  
  def show
    _show(Business)
  end
  
  def create
    _create(Business, :business)
  end
  
  def edit
    _edit(Business)
  end
  
  def update
    _update(Business, :business)
  end
  
end
