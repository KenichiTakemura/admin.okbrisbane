class ImmigrationsController < PostsController
  
  @@management_path = "sales_managements"
  def new
    _new(Immigration)
  end
  
  def show
    _show(Immigration)
  end
    
  def create
    _create(Immigration, :immigration)
  end
  
  def edit
    _edit(Immigration)
  end
  
  def update
    _update(Immigration, :immigration)
  end
  
  def destroy
    _destroy(Immigration)
  end
 
  # ajax request
  def upload
    _upload(Immigration)
  end
  
end