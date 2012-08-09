class PostsController < ApplicationController

  before_filter :checkCategory, :only => [:new, :show, :edit, :create, :update, :destroy]
  before_filter :checkPage, :only => [:new, :show, :edit, :create, :destroy]

  protected

  @@management_path = ""
  def checkCategory
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end

  def checkPage
    @current_page = params[:page]
    raise "No page set" if @current_page.nil?
  end

  def _new(model)
    @post = model.new
    @post.build_content
    respond_to do |format|
      format.html { render :template => "#{@@management_path}/new" }
      format.json { render json: @post }
    end
  end

  def _show(model)
    @post = model.find(params[:id])
    logger.debug("post: #{@post}")
    respond_to do |format|
      format.html { render :template => "#{@@management_path}/show" }
      format.json { render json: @post }
    end
  end

  def _edit(model)
    @post = model.find(params[:id])
    logger.debug("@post.content: #{@post.content}")
    if @post.content.nil?
    @post.build_content
    end
    respond_to do |format|
      format.html { render :template => "#{@@management_path}/edit" }
      format.json { render json: @post }
    end

  end

  def _create(model, model_symbol)
    @post = model.new(params[model_symbol])
    respond_to do |format|
      if @post.save
        @post.set_user(current_admin)
        @post.build_content
        format.html { render :template => "#{@@management_path}/edit", notice: I18n.t('successfully_created') }
        format.json { render json: @post, status: :created }
      else
        logger.debug("@post.errors: #{@post.errors}")
        format.html { render :template => "#{@@management_path}/new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def _update(model, model_symbol)
    @post = model.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[model_symbol])
        format.html { redirect_to sales_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :template => "#{@@management_path}/edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def _destroy(model)
    @post = model.find(params[:id])
    @post.destroy
    respond_to do |format|
    if @@management_path.eql? "sales_managements"
        format.html { redirect_to sales_managements_url(:category => @category, :page => @current_page) }
      else
        format.html { redirect_to posts_managements_url(:category => @category, :page => @current_page) }
      end
      format.json { head :no_content }
    end
  end

  def _upload(model)
    post = model.find(params[:id])
    _file = params[:file]
    logger.debug("original_filename: #{_file.original_filename}")
    logger.debug("content_type: #{_file.content_type}")
    logger.debug("tempfile: #{_file.tempfile.path}")
    logger.debug("size: #{_file.size}")
    _name = _file.original_filename
    image = Image.new(:avatar =>  _file)
    image.attached_to(post)
    images = post.image.collect{|i| i.id}
    images_w = post.image.collect{|i| i.width}
    images_h = post.image.collect{|i| i.height}
    images_t = post.image.collect{|i| i.avatar.url(:thumb)}
    images_o = post.image.collect{|i| i.avatar.url(:original)}
    render :json => {:result => I18n.t('successfully_uploaded'), :images => images, :w => images_w, :h => images_h, :images_t => images_t, :images_o => images_o}
  end

  def get_url
    case @@management_path
    when "sales_managements"
      return sales_managements_url
    when "posts_managements"
      return posts_managements_url
    else
    raise "Bad Url Request"
    end
  end
end
