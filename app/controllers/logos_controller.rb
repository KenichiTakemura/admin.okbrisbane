class LogosController < ApplicationController
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
    @logo = Logo.new
    @logo.device = Webcom::Browser::DEVISE_PC
    @business_client = BusinessClient.find_by_id(params[:client])
    logger.debug("business_client: #{@business_client}")
    #Do not attach in here since table is created.
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @logo }
    end
  end

  # POST /business_profile_images
  # POST /business_profile_images.json
  def create
    @business_client = BusinessClient.find_by_id(params[:logo][:attached_id])
    begin
      @logo = Logo.new(params[:logo])
      respond_to do |format|
        if @logo.thumbnailable?
          @logo.save
          logger.debug("@logo saved.")
          @logo.attached_to(@business_client)
          format.html { redirect_to @business_client, :notice => t('successfully_created') }
          format.json { render :json =>  @logo, :status =>  :created, :location => @logo }
        else
          flash[:alert] = I18n.t("invalid_file_extention")
          format.html { render :action =>  "new" }
          format.json { render :json =>  @logo.errors, :status =>  :unprocessable_entity }
        end
      end
    rescue
      @logo = Logo.new
      @logo.device = Webcom::Browser::DEVISE_PC
      logger.error("Something went wrong. #{$!}")
      flash[:alert] = I18n.t("failed_to_upload_with_reason", :reason => "#{$!}")
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @logo.errors, :status => :unprocessable_entity }
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
