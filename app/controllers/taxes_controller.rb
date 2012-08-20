class TaxesController < PostsController
  
  @@management_path = "sales_managements"
  
  def show
    _show(Tax)
  end
    
  def create
    _create(Tax, :tax)
  end
  
  def edit
    _edit(Tax)
  end
  
  def update
    _update(Tax, :tax)
  end
  
end