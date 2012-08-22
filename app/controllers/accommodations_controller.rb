class AccommodationsController < PostsController
  
  @@management_path = "sales_managements"

  def create
    _create(Accommodation, :accommodation)
  end

  def update
    _update(Accommodation, :accommodation)
  end

end
