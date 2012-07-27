class ManagementsController < ApplicationController

  before_filter :checkCategory, :only => [:destroy_image]

  def checkCategory
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end
  
  def _index
    @category = params[:category]
    if !@category || @category.empty?
      logger.debug("@category is empty")
      respond_to do |format|
        format.html # index.html.erb
        return nil
      end
    end
    @@page = params[:page]
    logger.debug("category: #{@category} page: #{@@page}")
    @current_page = @@page.to_s
  end
  
  # ajax request
  # Delete an image
  def _destroy_image
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
  end
  
  protected
  
  def getPost(model, page)
    post = model.order.page page
    if post.empty? && page.to_i > 1
        post = model.order.page page.to_i - 1
    end
    post
  end

end
