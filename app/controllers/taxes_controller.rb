class TaxesController < PostsController
  
  @@management_path = "sales_managements"

  def create
    _create(Tax, :tax)
  end
  
  def update
    _update(Tax, :tax)
  end
  
end