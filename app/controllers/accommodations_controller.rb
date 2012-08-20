class AccommodationsController < PostsController
  
  @@management_path = "sales_managements"
  def show
    _show(Accommodation)
  end
  
  def create
    _create(Accommodation, :accommodation)
  end
  
  def edit
    _edit(Accommodation)
  end
  
  def update
    _update(Accommodation, :accommodation)
  end

end
