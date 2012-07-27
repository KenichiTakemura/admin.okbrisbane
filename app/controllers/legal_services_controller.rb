class LegalServicesController < PostsController
  
  def new
    _new(Law)
  end
  
  def show
    _show(Law)
  end
    
  def create
    _create(Law, :law)
  end
  
  def edit
    _edit(Law)
  end
  
  def update
    _update(Law, :law)
  end
  
  def destroy
    _destroy(Law)
  end
 
  # ajax request
  def upload
    _upload(Law)
  end
  
end