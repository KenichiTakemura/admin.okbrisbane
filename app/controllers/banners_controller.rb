class BannersController < ApplicationController

  before_filter :_page 

  def index
    _page
    if (params[:page_id] && !params[:page_id].empty?)
      @banners = Banner.where('page_id = ?', params[:page_id]).order
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @banners }
    end
  end
  
  def image_size_index
    banners  = Banner.where("is_disabled = false")
    @style_class = "image_size_list"
    img_resolutions = Common.new_orderd_hash
    @image_size_map = Common.new_orderd_hash
    banners.each do |b|
      if !img_resolutions[b.img_resolution.to_sym]
        img_resolutions[b.img_resolution.to_sym] = b.img_resolution 
        @image_size_map[b.img_resolution.to_sym] = Array.new
      end
    end
    img_resolutions.each do |key,value|
      banners.each do |b|
        @image_size_map[key].push(b.name) if value.eql?(b.img_resolution)
      end
    end
    logger.debug("@image_size_map: #{@image_size_map}")
  end
  
  def all_page_index
    @allpages = Common.new_orderd_hash
    @position_id_max = Common.new_orderd_hash
    @position_id_max[:s_header] = Banner.where("section_id = ?",Style.sectionid(:s_header)).maximum("position_id")
    @position_id_max[:s_background] = Banner.where("section_id = ?",Style.sectionid(:s_background)).maximum("position_id")
    @position_id_max[:s_body] = Banner.where("section_id = ?",Style.sectionid(:s_body)).maximum("position_id")
    Style.banner_pages.each do |key,value|
      banners = Common.new_orderd_hash
      banners[:s_header] = Banner.where("page_id = ? and section_id = ?", Style.pageid_key(key), Style.sectionid(:s_header)).order("position_id")
      banners[:s_background] = Banner.where("page_id = ? and section_id = ?", Style.pageid_key(key), Style.sectionid(:s_background)).order("position_id")
      banners[:s_body] = Banner.where("page_id = ? and section_id = ?", Style.pageid_key(key), Style.sectionid(:s_body)).order("position_id")
      @allpages[key] = banners
    end
    @style_class = "all_page_list"
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])
    logger.debug("show @banner: #{@banner}")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @banner }
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
        format.html { redirect_to banner_path(@banner, :page_id => @page_id), :notice => t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def select
    @banner = Banner.find(params[:banner])
    _page
    @banners = Banner.where("page_id = ? AND is_disabled = ?", @page_id, false)
    clients = BusinessClient.with_banner
    all_image_size = 0
    @business_clients = Array.new
    clients.each do |client|
      @business_clients.push(["#{client.business_name} (#{client.client_image.size})", client.id])
      all_image_size += client.client_image.size
    end
    @business_clients.insert(0, ["#{I18n.t(:all_client)} (#{all_image_size})", -1])
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
    #@business_client = _business_client(@client_image.attached)
    @business_clients = _business_client(params[:business_client])
    @banner = Banner.find(params[:banner])
  end
  
  # Ajax
  def dettach_banner_image
    @client_image = ClientImage.find(params[:client_image])
    @banner = Banner.find(params[:banner])
    @banner.client_image.destroy(@client_image)
    #@business_client = _business_client(@client_image.attached)
    @business_clients = _business_client(params[:business_client])
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
    @banner = Banner.find(params[:banner]) 
    if id.to_i >= 0
      @business_clients = BusinessClient.where('id = ?', id)
      logger.debug("@business_clients: #{@business_clients}")
    else
      @business_clients = BusinessClient.with_banner
    end
    if params[:size].eql?("not_selected")
      @business_clients.each do |business_client|
        business_client.client_image.each do |image|
          if image.banner.present?
            image.is_deleted = true
          end
        end
      end
    elsif params[:size].eql?("specific")
      @business_clients.each do |business_client|
        business_client.client_image.each do |image|
          if image.original_size != @banner.img_resolution
            image.is_deleted = true
          end
         end
      end
    end
    @business_clients
  end
end
