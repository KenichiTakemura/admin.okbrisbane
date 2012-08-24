class PostsController < ApplicationController

  before_filter :checkCategory, :only => [:create, :update]
  before_filter :checkPage, :only => [:show, :edit]

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
          attachment.attached_to_by(@post, current_admin)
        end
        flash[:notice] = I18n.t("successfully_created")
        respond_to do |format|
          if @@management_path.eql? "sales_managements"
            format.html { redirect_to sales_managements_path(:category => @category) }
          elsif @@management_path.eql? "posts_managements"
            format.html { redirect_to posts_managements_path(:category => @category) }
          elsif @@management_path.eql? "issues_managements"
            format.html { redirect_to issues_managements_path(:category => @category) }
          else
            raise "Bad management_path #{@@management_path}"
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
        elsif @@management_path.eql? "posts_managements"
          format.html { redirect_to posts_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        elsif @@management_path.eql? "issues_managements"
          format.html { redirect_to issues_managements_url(:category => @category), notice: I18n.t('successfully_updated') }
        else
          raise "Bad management_path #{@@management_path}"
        end
        format.json { head :no_content }
      else
        flash[:warning] = I18n.t("failed_to_create")
        format.html { render :template => "#{@@management_path}/edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
