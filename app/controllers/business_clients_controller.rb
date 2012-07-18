class BusinessClientsController < ApplicationController
  # GET /business_clients
  # GET /business_clients.json
  def index
    @business_clients = BusinessClient.order.page params[:page]
    @business_clients.each do |business_client|
       logger.debug("id: #{business_client.id} number_of_images: #{business_client.client_image.size}")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_clients }
    end
  end

  # GET /business_clients/1
  # GET /business_clients/1.json
  def show
    @business_client = BusinessClient.find(params[:id])
    logger.debug("@business_client: #{@business_client}")
    @current_page = params[:page]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_client }
    end
  end

  # GET /business_clients/new
  # GET /business_clients/new.json
  def new
    @business_client = BusinessClient.new
    @business_client.build_business_profile
    logger.debug("@business_client: #{@business_client}")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_client }
    end
  end

  # GET /business_clients/1/edit
  def edit
    @business_client = BusinessClient.find(params[:id])
  end

  # POST /business_clients
  # POST /business_clients.json
  def create
    @business_client = BusinessClient.new(params[:business_client])

    respond_to do |format|
      if @business_client.save
        format.html { redirect_to @business_client, notice: t("successfully_created") }
        format.json { render json: @business_client, status: :created, location: @business_client }
      else
        format.html { render action: "new" }
        format.json { render json: @business_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_clients/1
  # PUT /business_clients/1.json
  def update
    @business_client = BusinessClient.find(params[:id])

    respond_to do |format|
      if @business_client.update_attributes(params[:business_client])
        format.html { redirect_to @business_client, notice: t("successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_clients/1
  # DELETE /business_clients/1.json
  def destroy
    @business_client = BusinessClient.find(params[:id])
    @business_client.destroy

    respond_to do |format|
      format.html { redirect_to business_clients_url }
      format.json { head :no_content }
    end
  end
  
  def destroy_image
    @business_client = BusinessClient.find(params[:id])
    client_images = @business_client.client_image
    logger.debug("client_images: #{client_images}")
    client_images.each do |image|
      logger.info("image is deleted. #{image}")
      image.destroy
    end
    respond_to do |format|
      format.html { redirect_to business_clients_url }
      format.json { head :no_content }
    end
  end
end
