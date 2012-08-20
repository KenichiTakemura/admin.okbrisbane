class StudiesController < PostsController
  
  @@management_path = "sales_managements"
  
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
  
end