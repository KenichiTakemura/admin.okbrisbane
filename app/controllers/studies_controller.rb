class StudiesController < PostsController
  
  @@management_path = "sales_managements"
  def new
    _new(Study)
  end
  
  def show
    _show(Study)
  end
    
  def create
    _create(Study, :study)
  end
  
  def edit
    _edit(Study)
  end
  
  def update
    _update(Study, :study)
  end
  
  def destroy
    _destroy(Study)
  end
 
  # ajax request
  def upload
    _upload(Study)
  end
  
end