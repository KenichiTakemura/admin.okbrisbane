class JobsController < PostsController

  @@management_path = "posts_managements"  

  def create
    _create(Job, :job)
  end
  
  def update
    _update(Job, :job)
  end
  
end