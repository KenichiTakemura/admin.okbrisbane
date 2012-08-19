class JobsController < PostsController

  @@management_path = "posts_managements"  

  def show
    _show(Job)
  end
    
  def create
    _create(Job, :job)
  end
  
  def edit
    _edit(Job)
  end
  
  def update
    _update(Job, :job)
  end
  
end