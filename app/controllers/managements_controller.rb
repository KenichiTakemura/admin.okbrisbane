class ManagementsController < ApplicationController

  before_filter :checkCategory, :only => [:write, :destroy_image,:destroy]
  def checkCategory
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end

  protected

  def _index
    @category = params[:category]
    logger.debug("PostsManagementsController.index @category: #{@category}")
    if !@category || @category.empty?
      logger.debug("@category is empty")
      respond_to do |format|
        format.html # index.html.erb
        return
      end
    end
    @@page = params[:page]
    logger.debug("category: #{@category} page: #{@@page}")
    @current_page = @@page.to_s
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

  def _write_post
    post = _model(@category).new
    post.write_at = Time.now.to_i
    post.build_content
    post.valid_until = post_expiry
    post
  end

  def _destroy
    @post = _model(@category).find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_managements_url(:category => @category, :page => @current_page) }
      format.json { head :no_content }
    end
  end

  # ajax request
  # Delete an image
  def _destroy_image
    @post = _model(@category).find(params[:id])
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
  end

  def _delete_image
    logger.debug("_delete_image")
    image = Image.find(params[:id])
    @timestamp = params[:t]
    image.destroy
    @images = Image.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, @timestamp)
  end

  def _upload_image
    logger.debug("_upload_image")
    file = params[:file]
    timestamp = params[:timestamp]
    image = Image.new(:avatar => file)
    if image.thumbnailable?
      image.write_at = timestamp;
      image.something = params[:something]
      image.attached_by(current_admin)
      logger.debug("image saved. #{image}")
      images = Image.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, timestamp)
      image_ids = images.collect{|i| i.id}
      thumbnails = images.collect{|i| i.thumb_image}
      somethingies = images.collect{|i| i.something}
      render :json => {:result => 0, :images => image_ids, :thumbnails => thumbnails, :somethingies => somethingies }
    else
      logger.debug("not thumbnailable? #{image}")
      render :json => {:result => 1}
    end
  end

  MODELS = {:p_job => Job,
    :p_buy_and_sell => BuyAndSell,
    :p_well_being => WellBeing,
    :p_estate => Estate,
    :p_motor_vehicle => MotorVehicle,
    :p_business => Business,
    :p_accommodation => Accommodation,
    :p_law => Law,
    :p_tax => Tax,
    :p_study => Study,
    :p_immig => Immigration,
    :p_yellowpage => BusinessClient,
    :p_sponsor => BusinessClient,
    :p_mypage => Mypage
  }

  def _model(category)
    model = MODELS[category.to_sym]
    raise "Bad Request for MODEL #{category}" if model.nil?
    model
  end

  def getPostByUser(model, page, user)
    post = model.where("posted_by_id = ?", user).order.page page
    if post.empty? && page.to_i > 1
      post = model.where("posted_by_id = ?", user).order.page page.to_i - 1
    end
    post
  end

  def getPost(model, page, status)
    if status.nil? || status.eql?("valid")
    post = model.is_valid.order.page page
    elsif status.eql?("invalid")
    post = model.is_invalid.order.page page
    elsif status.eql?("expired")
      post = model.where("valid_until < ?", Time.now).order.page page
    else
      raise "Bad status #{status}"
    end
    if post.empty? && page.to_i > 1
      if status.nil? || status.eql?("valid")
      post = model.is_valid.order.page page.to_i - 1
      elsif status.eql?("invalid")
      post = model.is_invalid.order.page page.to_i - 1
      elsif status.eql?("expired")
        post = model.where("valid_until < ?", Time.now).order.page page.to_i - 1
      end
    end
    post
  end

end
