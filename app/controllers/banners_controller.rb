class BannersController < ApplicationController

  before_filter :checkPage, :only => [:new, :show, :edit, :update]
  
  def checkPage
    @current_page = params[:page]
    raise "No page" if @current_page.nil?
  end
  
  # GET /banners
  # GET /banners.json
  def index
    if(params[:page_id] && !params[:page_id].empty?)
      @banners = Banner.where('page_id = ?', params[:page_id]).order.page params[:page]
    elsif (params[:section_id] && !params[:section_id].empty?)
       @banners = Banner.where('section_id = ?', params[:section_id]).order.page params[:page]
     else
      @banners = Banner.order.page params[:page]
    end
    @page_id = params[:page_id]
    @section_id = params[:section_id]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end


  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # PUT /banners/1
  # PUT /banners/1.json
  def update
    @banner = Banner.find(params[:id])
    new_banner = params[:banner]
    logger.debug("new_banner: #{new_banner}")
    new_banner[:display_name] = nil if new_banner[:display_name].empty?
    respond_to do |format|
      if @banner.update_attributes(new_banner)
        format.html { redirect_to banner_path(@banner, :page => @current_page), notice: t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

end
