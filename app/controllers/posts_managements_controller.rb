class PostsManagementsController < ManagementsController
  
  def index
    _index
  end
  
  def write
    @post = _write_post
  end

  def edit
   @post = _edit
  end
  
  def show
   @post = _show
  end
  
  def destroy
    _destroy
  end
  
  # ajax request
  # Delete an image
  def destroy_image
    _destroy_image
  end
  
  def delete_image
    _delete_image
  end

  def upload_image
    _upload_image
  end
  
  def get_image
    _get_image
  end
  
end
