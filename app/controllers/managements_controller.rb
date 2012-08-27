class ManagementsController < ApplicationController

  before_filter :checkCategory, :only => [:write, :edit, :show, :destroy_image,:destroy, :upload_image, :upload_image_from_url, :upload_attachment]
  def checkCategory
    logger.debug("checkCategory: #{params[:category]}")
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end

  protected

  @@management_path = "this_is_over_written"

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
      format.json { render :json => @post }
    end
  end

  def _write_post
    post = _model(@category).new
    post.write_at = Time.now.utc.to_i
    post.build_content
    post.valid_until = post_expiry
    @managements_path = @@management_path
    post
  end

  def _edit
    post = _model(@category).find(params[:id])
    post
  end

  def _show
    post = _model(@category).find(params[:id])
    # Only Issue can have comment
    @comment = Comment.new if(@category.eql?(Style.page(:p_issue)))
    post
  end

  def _destroy
    @post = _model(@category).find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to management_path(@category, @current_page) }
      format.json { head :no_content }
    end
  end

  # ajax request
  # Image
  def _destroy_image
    @post = _model(@category).find(params[:id])
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
  end

  def _delete_image
    logger.debug("_delete_image")
    image = Image.find(params[:a_id])
    @timestamp = params[:t]
    image.destroy
    @images = find_image(@timestamp, params[:id])
  end

  def _upload_image
    logger.debug("_upload_image")
    file = params[:file]
    timestamp = params[:timestamp]
    image = Image.new(:avatar => file)
    if image.thumbnailable?
      image.write_at = timestamp;
      image.something = params[:something]
      image.link_to_url = params[:link_to_url]
      image.save
      if params[:id]
        image.attached_to_by(_model(@category).find(params[:id]), current_admin)
      else
        image.attached_by(current_admin)
        image.update_attribute(:attached_type, _model(@category).to_s)
      end
      logger.debug("image saved. #{image}")
      _get_image
    else
      logger.debug("not thumbnailable? #{image}")
      render :json => {:result => 2}
    end
  end
  
  def _read_image_from_url
    logger.debug("_upload_image_from_url")
    render :json => {:result => _validate_url(params[:source_url])}
  end

  def _upload_image_from_url
    logger.debug("_upload_image_from_url")
    result = _validate_url(params[:source_url])
    if result == 0 
      source_url = params[:source_url]
      timestamp = params[:timestamp]
      image = Image.new(:source_url => source_url)
      image.write_at = timestamp;
      image.something = params[:something]
      image.link_to_url = params[:link_to_url]
      image.save
      if params[:id]
        image.attached_to_by(_model(@category).find(params[:id]), current_admin)
      else
        image.attached_by(current_admin)
        image.update_attribute(:attached_type, _model(@category).to_s)
      end
      logger.debug("image saved. #{image}")
      _get_image
    else
      logger.debug("not thumbnailable? #{image}")
      render :json => {:result => result}
    end
  end


  def _get_image
    timestamp = params[:timestamp]
    images = find_image(timestamp, params[:id])
    image_ids = images.collect{|i| i.id}
    thumbnails = images.collect{|i| i.thumb_image}
    widths = images.collect{|i| i.width}
    heights = images.collect{|i| i.height}
    somethingies = images.collect{|i| i.something}
    render :json => {:result => 0, :images => image_ids, :thumbnails => thumbnails, :widths => widths, :heights => heights, :somethingies => somethingies }
  end

  # Attachment
  
  def _delete_attachment
    logger.debug("_delete_attachment")
    attachment = Attachment.find(params[:a_id])
    @timestamp = params[:t]
    attachment.destroy
    @attachments = find_attachment(@timestamp, params[:id])
  end

  def _upload_attachment
    logger.debug("_upload_attachment")
    file = params[:file]
    timestamp = params[:timestamp]
    attachment = Attachment.new(:avatar => file)
    if attachment.attachmentable?
      attachment.write_at = timestamp;
      if params[:id]
        attachment.attached_to_by(_model(@category).find(params[:id]), current_admin)
      else
        attachment.attached_by(current_admin)
        attachment.update_attribute(:attached_type, _model(@category).to_s)
      end
      logger.debug("attachment saved. #{attachment}")
      _get_attachment(timestamp)
    else
      logger.debug("not attachmentable? #{attachment}")
      render :json => {:result => 2}
    end
  end

  def _get_attachment(timestamp)
    attachments = find_attachment(timestamp, params[:id])
    attachment_ids = attachments.collect{|i| i.id}
    attachment_filenames = attachments.collect{|i| i.filename}
    render :json => {:result => 0, :attachments => attachment_ids, :filenames => attachment_filenames }
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
    :p_mypage => Mypage,
    :p_issue => Issue
  }

  def _model(category)
    logger.debug("_model category: #{category}")
    model = MODELS[Style.m2s(category)]
    logger.debug("_model model: #{model}")
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
    post = model.expired.order.page page
    else
      raise "Bad status #{status}"
    end
    if post.empty? && page.to_i > 1
      if status.nil? || status.eql?("valid")
      post = model.is_valid.order.page page.to_i - 1
      elsif status.eql?("invalid")
      post = model.is_invalid.order.page page.to_i - 1
      elsif status.eql?("expired")
      post = model.expired.order.page page.to_i - 1
      end
    end
    post
  end

  def find_image(timestamp, id)
    if id
      Image.where("attached_by_id = ? AND attached_id = ? AND write_at = ?", current_admin, id, timestamp)
    else
      Image.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, timestamp)
    end
  end
  
  def find_attachment(timestamp, id)
    if id
      Attachment.where("attached_by_id = ? AND attached_id = ? AND write_at = ?", current_admin, id, timestamp)
    else
      Attachment.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, timestamp)
    end
  end
  
  def management_path(category, page)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? @category
      return posts_managements_path(:category => @category, :page => @current_page)
    elsif [Style.page(:p_issue)].include? @category
      return issues_managements_path(:category => @category, :page => @current_page)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? @category
      return sales_managements_path(:category => @category, :page => @current_page)
    else
      raise "Bad Category"
    end
  end
  
  def _validate_url(source_url)
    require 'open-uri'
    begin
      io = open(source_url)
      status = io.status
      logger.debug("#{source_url} status: #{status} content_type #{io.content_type}")
      if Okvalue::FLASH_THUMBNAILABLE.include?(io.content_type) 
        return 0
      else
        logger.info("Not accessible content_type #{io.content_type}")
        return 1
      end
    rescue
      logger.info("Not accessible link #{source_url}")
      return 2
    end
  end

end
