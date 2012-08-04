class ClientImagesController < ApplicationController

  def _image_map
    banners  = Banner.all
    @img_resolutions = Hash.new
    banners.each do |b|
      @img_resolutions[b.img_resolution.to_sym] = b.img_resolution if !@img_resolutions[b.img_resolution.to_sym]
    end
  end

  # GET /client_images/new
  # GET /client_images/new.json
  def new
    @current_page = params[:page]
    @client_image = ClientImage.new
    _image_map
    # Called from BusinessClient
    if(params[:client])
      @business_client = BusinessClient.find_by_id(params[:client])
      logger.debug("business_client => #{@business_client}")
    end
    logger.debug(@client_image)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_image }
    end
  end
  
  def edit
    @client_image = ClientImage.find(params[:id])
    _image_map
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
  end
  
  def update
    @client_image = ClientImage.find(params[:id])
    _image_map
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
   respond_to do |format|
      if @client_image.update_attributes(params[:client_image])
        format.html { redirect_to @business_client, notice: t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /client_images
  # POST /client_images.json
  def create
    @client_image = ClientImage.new(params[:client_image])
    logger.debug("client_image: #{@client_image}")
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
    logger.debug("business_client: #{@business_client}")
    _image_map
    respond_to do |format|  
      if @client_image.save
        logger.debug("client_image saved: #{@client_image}")
        @client_image.attached_to(@business_client)
        # This must be donw to update images in another new view
        @business_client = BusinessClient.find_by_id(@client_image.attached_id)
        flash[:notice] = t("successfully_created")
        @client_image = ClientImage.new
        format.html { render action: "new" }
        format.json { render json: @client_image, status: :created, location: @client_image }
      else
        format.html { render action: "new" }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /client_images/1
  def destroy
    @client_image = ClientImage.find(params[:id])
    @business_client = @client_image.attached
    logger.debug("Delete client_image: #{@client_image}")
    @client_image.destroy

    respond_to do |format|
    # redirec_to business_clients#show
      format.html { redirect_to @business_client }
      format.json { head :no_content }
    end
  end

  # POST /client_images/1/banner
  def dettach
    @client_image = ClientImage.find(params[:id])
    @banner = @client_image.attached
    logger.debug("Dettach client_image: #{@client_image} banner: #{@banner}")
    @client_image.attached_to(nil)
    @client_image.save
    respond_to do |format|
    # redirec_to business_clients#show
      format.html { redirect_to @banner }
      format.json { head :no_content }
    end
  end
end
