class EstatesController < ApplicationController
  
  before_filter :checkCategory, :only => [:new, :show, :edit, :create, :update, :destroy]
  
  def new
    _new(Estate)
  end
  
  def show
    _show(Estate)
  end
  
  def edit
    _edit(Estate)
  end
  
  def create
    _create(Estate)
  end
  
  def update
    _update(Estate)
  end
  
  def destroy
    _destroy(Estate)
  end
 
  # ajax request
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
    images = estate.image.collect{|i| i.id}
    images_t = estate.image.collect{|i| i.avatar.url(:thumb)}
    images_o = estate.image.collect{|i| i.avatar.url(:original)}
    render :json => {:result => I18n.t('successfully_uploaded'), :images => images, :images_t => images_t, :images_o => images_o}
  end
  
  protected
  
  def checkCategory
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end
  
  def _new(model)
    @post = model.new
    @post.build_content
    respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @estate }
      #format.html { render action: "new", :controller => "sales_management" }
      format.html { render :template => "sales_managements/new" }
      format.json { render json: @post }
    end
  end

  def _show(model)
    @post = model.find(params[:id])
    @current_page = params[:page]
    respond_to do |format|
        format.html { render :template => "sales_managements/show" }
        format.json { render json: @post }
    end
  end

  def _edit(model)
    @post = model.find(params[:id])
    logger.debug("@post.content: #{@post.content}")
    if @post.content.nil?
      # Build only empty otherwise rails to delete exiting content
      @post.build_content
     end
     respond_to do |format|
        format.html { render :template => "sales_managements/edit" }
        format.json { render json: @post }
    end

  end

  def _create(model)
    @post = model.new(params[:estate])
    respond_to do |format|
      if @post.save
        @post.set_user(current_admin)
        @post.build_content
        format.html { render :template => "sales_managements/edit", notice: I18n.t('successfully_created') }
        #format.html { redirect_to edit_estate_path(@estate, :category => 'estate'), notice: I18n.t('successfully_created') }
        #format.json { render json: @post, status: :created, location: edit_estate_path(@post) }
        format.json { render json: @post, status: :created }
      else
        #flash[:warning] = I18n.t("failed_to_create")
        logger.debug("@post.errors: #{@post.errors}")
        format.html { render :template => "sales_managements/new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def _update(model)
    @post = model.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:estate])
        format.html { redirect_to sales_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :template => "sales_managements/edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def _destroy(model)
    @post = model.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to sales_managements_url(:category => @category) }
      format.json { head :no_content }
    end
  end

end
