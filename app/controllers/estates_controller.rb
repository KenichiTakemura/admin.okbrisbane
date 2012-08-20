class EstatesController < PostsController

  @@management_path = "sales_managements"

  def show
    _show(Estate)
  end

  def create
    _create(Estate, :estate)
  end

  def edit
    _edit(Estate)
  end

  def update
    _update(Estate, :estate)
  end

end
