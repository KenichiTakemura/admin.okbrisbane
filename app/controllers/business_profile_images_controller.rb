class BusinessProfileImagesController < ApplicationController
  # GET /business_profile_images
  # GET /business_profile_images.json
  def index
    @business_profile_images = BusinessProfileImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>  @business_profile_images }
    end
  end

  # GET /business_profile_images/1
  # GET /business_profile_images/1.json
  def show
    @business_profile_image = BusinessProfileImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @business_profile_image }
    end
  end

  # GET /business_profile_images/new
  # GET /business_profile_images/new.json
  def new
    @business_profile_image = BusinessProfileImage.new
    @business_client = BusinessClient.find_by_id(params[:client])
    logger.debug("business_client: #{@business_client}")
    #Do not attach in here since table is created.
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @business_profile_image }
    end
  end

  # GET /business_profile_images/1/edit
  def edit
    @business_profile_image = BusinessProfileImage.find(params[:id])
  end

  # POST /business_profile_images
  # POST /business_profile_images.json
  def create
    @business_profile_image = BusinessProfileImage.new(params[:business_profile_image])
    if @business_profile_image.attached_id
      @business_client = BusinessClient.find_by_id(@business_profile_image.attached_id)
    end    
    # mark is_main if the first one
    @business_profile_image.attached_to(@business_client)
    respond_to do |format|
      if @business_profile_image.save
        format.html { redirect_to @business_client, :notice => t('successfully_created') }
        format.json { render :json =>  @business_profile_image, :status =>  :created, :location => @business_profile_image }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @business_client.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  # PUT /business_profile_images/1
  # PUT /business_profile_images/1.json
  def update
    @business_profile_image = BusinessProfileImage.find(params[:id])

    respond_to do |format|
      if @business_profile_image.update_attributes(params[:business_profile_image])
        format.html { redirect_to @business_profile_image, :notice => t('successfully_updated.') }
        format.json { head :no_content }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @business_profile_image.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  # DELETE /business_profile_images/1
  # DELETE /business_profile_images/1.json
  def destroy
    @business_profile_image = BusinessProfileImage.find(params[:id])
    logger.debug("Delete business_profile_image: #{@business_profile_image}")
    @business_client = @business_profile_image.attached
    @business_profile_image.destroy

    respond_to do |format|
    #format.html { redirect_to business_profile_images_url }
    # redirec_to business_clients#show
      format.html { redirect_to @business_client }
      format.json { head :no_content }
    end
  end
end
