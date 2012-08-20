class PostsController < ApplicationController

  before_filter :checkCategory, :only => [:show, :edit, :create, :update, :destroy]
  before_filter :checkPage, :only => [:show, :edit, :destroy]

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
    if @post.category.eql?(Okvalue::ADMIN_POST_NOTICE)
      @post.z_index = Okvalue::ADMIN_POST_NOTICE_Z_INDEX
    else
      @post.z_index = Okvalue::ADMIN_POST_Z_INDEX
    end
        ActiveRecord::Base.transaction do
      if @post.save
        @post.set_user(current_admin)
        get_image(@post.write_at).each do |image|
          image.attached_to_by(@post, current_admin)
        end
        get_attachment(@post.write_at).each do |attachment|
          attachment.attached_to_by(@post, current_user)
        end
        flash[:notice] = I18n.t("successfully_created")
        respond_to do |format|
          if @@management_path.eql? "sales_managements"
            format.html { redirect_to sales_managements_path(:category => @category) }
          else
            format.html { redirect_to posts_managements_path(:category => @category) }
          end
          format.json { render json: @post, status: :created }
        end
      else
        flash[:warning] = I18n.t("failed_to_create")
        @post.errors.full_messages.each do |msg|
          logger.warn("@post.errors: #{msg}")
        end
        respond_to do |format|
          format.html { render :template => "#{@@management_path}/write" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def _update(model, model_symbol)
    @post = model.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[model_symbol])
        @post.updated_by(current_admin)
        if @@management_path.eql? "sales_managements"
          format.html { redirect_to sales_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        else
          format.html { redirect_to posts_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        end
        format.json { head :no_content }
      else
        format.html { render :template => "#{@@management_path}/edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
  
  private
  
  def get_image(timestamp)
    Image.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, timestamp)
  end

  def get_attachment(timestamp)
    Attachment.where("attached_by_id = ? AND attached_id is NULL AND write_at = ?", current_admin, timestamp)
  end
  
end
