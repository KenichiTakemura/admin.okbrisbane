class JobsController < PostsController

  @@management_path = "posts_managements"  
  def new
    _new(Job)
  end
  
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
  
  def destroy
    _destroy(Job)
  end
 
  # ajax request
  def upload
    _upload(Job)
  end
  
end