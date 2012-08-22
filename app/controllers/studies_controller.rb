class StudiesController < PostsController
  
  @@management_path = "sales_managements"

  def create
    _create(Study, :study)
  end

  def update
    _update(Study, :study)
  end
  
end