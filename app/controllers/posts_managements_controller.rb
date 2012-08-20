class PostsManagementsController < ManagementsController

  def index
    _index
  end
  
  def write
    @post = _write_post
  end
  
  def destroy
    _destroy
  end
  
  # ajax request
  # Delete an image
  def destroy_image
    _destroy_image
  end
  
end
