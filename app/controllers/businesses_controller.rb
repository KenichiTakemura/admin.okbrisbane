class BusinessesController < EstatesController
  
  def new
    _new(Business)
  end
  
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
  
  def destroy
    _destroy(Business)
  end
  
  # ajax request
  def upload
    _upload(Business)
  end
  
end
