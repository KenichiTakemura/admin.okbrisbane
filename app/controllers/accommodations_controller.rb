class AccommodationsController < PostsController
  
  @@management_path = "sales_managements"
  def new
    _new(Accommodation)
  end
  
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
  
  def destroy
    _destroy(Accommodation)
  end
  
  # ajax request
  def upload
    _upload(Accommodation)
  end
  
end
