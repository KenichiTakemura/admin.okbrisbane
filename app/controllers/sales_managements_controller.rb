class SalesManagementsController < ManagementsController
    
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
  
  def read_image_from_url
    _read_image_from_url
  end
  
  def upload_image_from_url
    _upload_image_from_url
  end
  
  def get_image
    _get_image
  end
  
  def delete_attachment
    _delete_attachment
  end

  def upload_attachment
    _upload_attachment
  end
  
  def get_attachment
    _get_attachment(params[:timestamp])
  end

end
