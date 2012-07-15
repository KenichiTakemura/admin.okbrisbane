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
    @banners  = Banner.all
    # Called from BusinessClient
    if(params[:client])
      @business_client = BusinessClient.find_by_id(params[:client])
      logger.debug("business_client => #{@business_client}")
      @client_image.business_client_id = @business_client.id
    end
    # Called from Banners
    if(params[:banner])
      @banner = Banner.find_by_id(params[:banner])
      logger.debug("banner => #{@banner}")
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
    logger.debug("client_image: #{@client_image}")
    @business_client = @client_image.business_client
    logger.debug("business_client: #{@business_client}")
    if @client_image.attached_id
      banner = Banner.find_by_id(@client_image.attached_id)
      @client_image.attached_to(banner)
      respond_to do |format|
        if @client_image.save
          # redirect_to  banner#show
          format.html { redirect_to @banner, notice: t("successfully_created") }
          format.json { render json: @client_image, status: :created, location: @client_image }
        else
          @banner = Banner.find_by_id(@client_image.attached_id)
          format.html { render action: "new" }
          format.json { render json: @banner.errors, status: :unprocessable_entity }
        end
      end
    elsif
    respond_to do |format|
    if @client_image.save
    # redirect_to  business_clients#show
    format.html { redirect_to @business_client, notice: t("successfully_created") }
    format.json { render json: @client_image, status: :created, location: @client_image }
    else
    @business_client = BusinessClient.find_by_id(@client_image.business_client_id)
    format.html { render action: "new" }
    format.json { render json: @client_image.errors, status: :unprocessable_entity }
    end
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

  # POST /client_images/1
  def destroy
    @client_image = ClientImage.find(params[:id])
    @business_client = @client_image.business_client
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
