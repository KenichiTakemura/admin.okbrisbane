class PostsManagementsController < ManagementsController

  def index
    return if _index.nil?
    logger.debug("PostsManagementsController.index @category: #{@category}")
    @post = getPost(_model(@category), @@page, params[:user])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end
  
  # ajax request
  # Delete an image
  def destroy_image
    @post = _model(@category).find(params[:id])
    _destroy_image
  end


end
