class TaxesController < PostsController
  
  def new
    _new(Tax)
  end
  
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
  
  def destroy
    _destroy(Tax)
  end
 
  # ajax request
  def upload
    _upload(Tax)
  end
  
end