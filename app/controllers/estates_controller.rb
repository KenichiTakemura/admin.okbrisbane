class EstatesController < PostsController

  @@management_path = "sales_managements"

  def create
    _create(Estate, :estate)
  end

  def update
    _update(Estate, :estate)
  end

end
