class BannersController < ApplicationController

  before_filter :_page 

  def index
    _page
    if (params[:page_id] && !params[:page_id].empty?)
      @banners = Banner.where('page_id = ?', params[:page_id]).order
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
    logger.debug("show @banner: #{@banner}")
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

  def update
    @banner = Banner.find(params[:id])
    _page
    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to banner_path(@banner, :page_id => @page_id), notice: t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def select
    @banner = Banner.find(params[:banner])
    _page
    @banners = Banner.where("page_id = ? AND is_disabled = ?", @page_id, false)
  end
  
  # Ajax
  def select_business_client_image
    _business_client(params[:id])
  end

  # Ajax
  def select_banner_image
    @banner = Banner.find(params[:id])
  end
  
  # Ajax
  def attach_banner_image
    @client_image = ClientImage.find(params[:client_image])
    @banner = Banner.find(params[:banner])
    @banner.client_image << @client_image
    @business_client = _business_client(@client_image.attached)
    @banner = Banner.find(params[:banner])
    logger.debug("client_image: #{@client_image} banner: #{@banner}")
  end
  
  # Ajax
  def dettach_banner_image
    @client_image = ClientImage.find(params[:client_image])
    @banner = Banner.find(params[:banner])
    @banner.client_image.delete(@client_image)
    @business_client = _business_client(@client_image.attached)
    @banner = Banner.find(params[:banner])
    logger.debug("client_image: #{@client_image} banner: #{@banner}")
  end

  private

  def _page
    @page_id = params[:page_id]
    @page_name = Style.pagename(@page_id)
    logger.debug("@page_id: #{@page_id} @page_name: #{@page_name}")
  end

  def _business_client(id)  
    @business_client = BusinessClient.find(id)
    if !params[:size] || params[:size].empty?
      return @business_client
    end
    @banner = Banner.find(params[:size]) 
    @business_client.client_image.each_with_index do |image,i|
      logger.debug("image.attached_id: #{image.attached}")
      if image.original_size != @banner.img_resolution
        logger.debug("original_size: #{image.original_size} is filtered out")
        image.is_deleted = true
      end
    end
    @business_client
  end
end
