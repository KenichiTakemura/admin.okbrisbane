class WellBeingsController < PostsController

  @@management_path = "posts_managements"  

  def show
    _show(WellBeing)
  end
    
  def create
    _create(WellBeing, :well_being)
  end
  
  def edit
    _edit(WellBeing)
  end
  
  def update
    _update(WellBeing, :well_being)
  end
  
end