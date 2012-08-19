class PostsManagementsController < ManagementsController

  def index
    return if _index.nil?
    logger.debug("PostsManagementsController.index @category: #{@category}")
    if params[:user]
      @post = getPostByUser(_model(@category), @@page, params[:user])
    else
      @post = getPost(_model(@category), @@page, params[:status])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end
  
  def write
    @post = _write_post
  end
  
  def expired
    return if _index.nil?
    logger.debug("PostsManagementsController.expired @category: #{@category}")
    @post = getExpiredPost(_model(@category), @@page)
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end
  
  # ajax request
  # Delete an image
  def destroy_image
    @post = _model(@category).find(params[:id])
    _destroy_image
  end
  
  def delete_image
    _delete_image
  end

  def upload_image
    _upload_image
  end
  

end
