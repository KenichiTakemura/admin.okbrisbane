class WellBeingsController < PostsController

  @@management_path = "posts_managements"  

  def create
    _create(WellBeing, :well_being)
  end
  
  def update
    _update(WellBeing, :well_being)
  end
  
end