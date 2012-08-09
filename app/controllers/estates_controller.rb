class EstatesController < PostsController

  @@management_path = "sales_managements"
  def new
    _new(Estate)
  end

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

  def destroy
    _destroy(Estate)
  end

  # ajax request
  def upload
    _upload(Estate)
  end

end
