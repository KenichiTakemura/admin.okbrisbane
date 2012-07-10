class ClientImagesController < ApplicationController
  # GET /client_images
  # GET /client_images.json
  def index
    @client_images = ClientImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_images }
    end
  end

  # GET /client_images/1
  # GET /client_images/1.json
  def show
    @client_image = ClientImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_image }
    end
  end

  # GET /client_images/new
  # GET /client_images/new.json
  def new
    @current_page = params[:page]
    @client_image = ClientImage.new
    @resolutions = Hash.new
    Banner.find(:all, :select => "width, height").each do |wh|
      resolution = wh.width.to_s << "x" << wh.height.to_s
      logger.debug("resolution: #{resolution}")
      @resolutions[resolution] = resolution
    end
    
    logger.debug("@resolutions: #{@resolutions}")
    if(params[:client])
      @business_client = BusinessClient.find_by_id(params[:client])
       logger.debug("business_client => #{@business_client}")
      @client_image.business_client_id = @business_client.id
    end
    logger.debug(@client_image)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_image }
    end
  end

  # GET /client_images/1/edit
  def edit
    @client_image = ClientImage.find(params[:id])
  end

  # POST /client_images
  # POST /client_images.json
  def create
    @client_image = ClientImage.new(params[:client_image])
    logger.debug(@client_image)
    respond_to do |format|
      if @client_image.save
        format.html { redirect_to @client_image, notice: 'Client image was successfully created.' }
        format.json { render json: @client_image, status: :created, location: @client_image }
      else
        @business_client = BusinessClient.find_by_id(@client_image.business_client_id)
        format.html { render action: "new" }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_images/1
  # PUT /client_images/1.json
  def update
    @client_image = ClientImage.find(params[:id])

    respond_to do |format|
      if @client_image.update_attributes(params[:client_image])
        format.html { redirect_to @client_image, notice: 'Client image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_images/1
  # DELETE /client_images/1.json
  def destroy
    @client_image = ClientImage.find(params[:id])
    @client_image.destroy

    respond_to do |format|
      format.html { redirect_to client_images_url }
      format.json { head :no_content }
    end
  end
end
