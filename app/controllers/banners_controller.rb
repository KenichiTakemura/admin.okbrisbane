class BannersController < ApplicationController

  before_filter :_page 

  def index
    _page
    if (params[:page_id] && !params[:page_id].empty?)
      @banners = Banner.where('page_id = ?', params[:page_id]).order
    else
      @banners = Banner.all
    end
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
    _page
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

  private

  def _page
    @page_id = params[:page_id]
    page = Page.find_by_id(@page_id)
    @page_name = page.name if !page.nil?
    logger.debug("@page_id: #{@page_id} @page_name: #{@page_name}")
  end
end
