class ClientImagesController < ApplicationController

  def new
    @current_page = params[:page]
    @client_image = ClientImage.new
    # Called from BusinessClient
    if(params[:client])
      @business_client = BusinessClient.find_by_id(params[:client])
      logger.debug("business_client => #{@business_client}")
    end
    logger.debug(@client_image)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client_image }
    end
  end
  
  def edit
    @client_image = ClientImage.find(params[:id])
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
  end
  
  def update
    @client_image = ClientImage.find(params[:id])
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
   respond_to do |format|
      if @client_image.update_attributes(params[:client_image])
        format.html { redirect_to @business_client, :notice => t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    _file = params[:client_image][:avatar]
    if _file.content_type.eql? Okvalue::FLASH_CONTENT_TYPE
      picture_file = "#{Rails.root.to_s}/tmp/#{_file.original_filename}.jpg"
      _temp_file = _file.tempfile.path
      picture_id = Kernel.`("/usr/local/bin/swfextract #{_temp_file} | grep -- -j | awk '{print $5}'")
      picture_id.delete!(",").chop!
      extract = Kernel.`("/usr/local/bin/swfextract #{_temp_file} -j #{picture_id} -o #{picture_file}")
      logger.debug("extract: #{extract}")
      params[:client_image].delete :avatar
      
      @client_image = ClientImage.new(params[:client_image])
      @client_image.avatar = File.new(picture_file)
      @client_image.avatar_content_type = Okvalue::FLASH_CONTENT_TYPE
      File.unlink(picture_file)
    else
      @client_image = ClientImage.new(params[:client_image])
    end
    logger.debug("client_image: #{@client_image}")
    @business_client = BusinessClient.find_by_id(@client_image.attached_id)
    logger.debug("business_client: #{@business_client}")
    respond_to do |format|  
      if @client_image.save
        logger.debug("client_image saved: #{@client_image.avatar.path(:original)}")
        if @client_image.flash?
          target = File.dirname(@client_image.avatar.path(:original)) + "/" + _file.original_filename
          logger.debug("copy: #{_temp_file} to #{target}")
          File.copy_stream(_file.tempfile.path, target)
          File.new(target).chmod(0644)
        end
        @client_image.attached_to(@business_client)
        # This must be donw to update images in another new view
        @business_client = BusinessClient.find_by_id(@client_image.attached_id)
        flash[:notice] = t("successfully_created")
        @client_image = ClientImage.new
        format.html { render :action => "new" }
        format.json { render :json => @client_image, :status => :created, :location => @client_image }
      else
        @client_image = ClientImage.new
        format.html { render :action => "new" }
        format.json { render :json => @client_image.errors, :status => :unprocessable_entity }
      end
    end
  end

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
