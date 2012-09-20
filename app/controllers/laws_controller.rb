class LawsController < PostsController

  @@management_path = "sales_managements"  
    
  def create
    _create(Law, :law)
  end

  def update
    _update(Law, :law)
  end
  
end