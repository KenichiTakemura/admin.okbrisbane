class BusinessClientsController < SearchablesController
  # GET /business_clients
  # GET /business_clients.json
  def index
    @business_clients = BusinessClient.order.page params[:page]
    @business_categories = BusinessCategory.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @business_clients }
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
      format.json { render :json => @business_client }
    end
  end

  # GET /business_clients/new
  # GET /business_clients/new.json
  def new
    @business_client = BusinessClient.new
    @business_client.build_business_profile
    @business_client.build_logo
    logger.debug("@business_client: #{@business_client}")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @business_client }
    end
  end

  # GET /business_clients/1/edit
  def edit
    @business_client = BusinessClient.find(params[:id])
    if !@business_client.logo.present?
    @business_client.build_logo
    end
  end

  # POST /business_clients
  # POST /business_clients.json
  def create
    business_category = BusinessCategory.find(params[:business_client][:business_category])
    params[:business_client].delete :business_category
    logo_param = params[:business_client].delete :logo
    @business_client = BusinessClient.new(params[:business_client])
    @business_client.business_category = business_category
    logo = Logo.new(:avatar => logo_param[:avatar])
    respond_to do |format|
      begin
        if @business_client.save
          if logo_param.present?
            if logo.save
              logo.attached_to(@business_client)
              format.html { redirect_to @business_client, :notice => t("successfully_created") }
              format.json { render :json => @business_client, :status => :created, :location => @business_client }
            else
              flash[:alert] = I18n.t("invalid_file_extention")
              @business_client.build_logo
              format.html { render :action => "new" }
            end
          else
            format.html { redirect_to @business_client, :notice => t("successfully_created") }
            format.json { render :json => @business_client, :status => :created, :location => @business_client }
          end
        else
          flash[:warning] = I18n.t("failed_to_create")
          @business_client.build_logo
          format.html { render :action => "new" }
          format.json { render :json => @business_client.errors, :status => :unprocessable_entity }
        end
      rescue Exception => e
        logger.error("something wrong e => #{$!}")
        flash[:alert] = I18n.t("failed_to_create")
        @business_client.build_logo
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /business_clients/1
  # PUT /business_clients/1.json
  def update
    @business_client = BusinessClient.find(params[:id])
    logger.debug("Business_client update #{@business_client}")
    business_category = BusinessCategory.find(params[:business_client][:business_category])
    params[:business_client].delete :business_category
    logo_param = params[:business_client].delete :logo
    @business_client.business_category = business_category
    logo = Logo.new(:avatar => logo_param[:avatar])
    respond_to do |format|
      begin
        if @business_client.update_attributes(params[:business_client])
          if logo_param.present?
            if logo.save
              @business_client.logo.destroy if @business_client.logo.present?
              logo.attached_to(@business_client)
              format.html { redirect_to @business_client, :notice => t("successfully_updated") }
              format.json { head :no_content }
            else
              flash[:alert] = I18n.t("invalid_file_extention")
              logger.warn("Cannot save logo. #{logo.errors.full_messages}")
              @business_client.build_logo
              format.html { render :action => "edit" }
            end
          else
            format.html { redirect_to @business_client, :notice => t("successfully_updated") }
            format.json { head :no_content }
          end
        else
          flash[:warning] = I18n.t("failed_to_create")
          format.html { render :action => "edit" }
          format.json { render :json => @business_client.errors, :status => :unprocessable_entity }
        end
      rescue Exception => e
        logger.error("something wrong e => #{$!}")
        flash[:alert] = I18n.t("failed_to_create")
        @business_client.build_logo
        format.html { render :action => "edit" }
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

  def select_category
    category = BusinessCategory.find(params[:category])
    @business_client = BusinessClient.find(params[:business_client])
    @business_client.update_attribute(:business_category, category)
  end

  def query
    clients = BusinessClient.query_by_name(@@query, QUERY_LIMIT)
    result = clients.collect{ |c| c.business_name}
    respond_to do |format|
      format.json { render :json => result }
    end
  end

  def search
    if @@key.present?
      @business_clients = BusinessClient.search(@@key, QUERY_LIMIT).page params[:page]
    else
      @business_clients = BusinessClient.order.page params[:page]
    end
    @business_categories = BusinessCategory.all
    respond_to do |format|
      format.js
    end
  end

end
