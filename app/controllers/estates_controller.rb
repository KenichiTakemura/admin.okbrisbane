class EstatesController < ApplicationController
  def new
    @category = params[:category]
    @estate = Estate.new
    @estate.build_content
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estate }
    end
  end
  
  def new_more
    @category = params[:category]
    @estate = Estate.find(params[:id])
    @estate.build_content
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estate }
    end
  end

  def edit
    @category = params[:category]
    @estate = Estate.find(params[:id])
  end

  def create
    @estate = Estate.new(params[:estate])
    respond_to do |format|
      if @estate.save
        @estate.set_user(current_admin)
        format.html { redirect_to new_more_estate_path(@estate, :category => 'estate'), notice: I18n.t('successfully_created') }
        format.json { render json: @estate, status: :created, location: new_more_estate_path(@estate) }
      else
        flash[:warning] = I18n.t("failed_to_create")
        logger.debug("@estate.errors: #{@estate.errors}")
        format.html { render action: "new" }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end
  
    def update
    @estate = Estate.find(params[:id])

    respond_to do |format|
      if @estate.update_attributes(params[:estate])
        format.html { redirect_to sales_managements_url(:category => 'estate'), notice: I18n.t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @estate = Estate.find(params[:id])
    @estate.destroy

    respond_to do |format|
      format.html { redirect_to sales_managements_url(:category => 'estate') }
      format.json { head :no_content }
    end
  end
  
  def upload
    estate = Estate.find(params[:id])
    _file = params[:file]
    logger.debug("original_filename: #{_file.original_filename}")
    logger.debug("content_type: #{_file.content_type}")
    logger.debug("tempfile: #{_file.tempfile.path}")
    logger.debug("size: #{_file.size}")
    _name = _file.original_filename
    #data = request.raw_post
    #@file_content = File.open("#{Rails.root.to_s}/tmp/#{_name}", "wb") do |f| 
    #  f.write(data)
    #end
    image = Image.new(:avatar =>  _file)
    image.attached_to(estate)
    #File.unlink("#{Rails.root.to_s}/tmp/#{_name}")
    render :json => {:result => I18n.t('successfully_uploaded')}
  end
end
