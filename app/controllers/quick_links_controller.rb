class QuickLinksController < ApplicationController

  def index
    @qlinks = QuickLink.order.page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @qlinks }
    end
  end

  def new
    @qlink = QuickLink.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @qlink }
    end
  end

  # GET /business_categories/1/edit
  def edit
    @qlink = QuickLink.find(params[:id])
  end

  # POST /business_categories
  # POST /business_categories.json
  def create
    @qlink = QuickLink.new(params[:quick_link])
    respond_to do |format|
      if @qlink.save
        format.html { redirect_to quick_links_path, :notice => t("successfully_created") }
        format.json { render :json => @qlink, :status => :created, :location => @qlink }
      else
        format.html { render :action => "new" }
        format.json { render :json => @qlink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /business_categories/1
  # PUT /business_categories/1.json
  def update
    @qlink = QuickLink.find(params[:id])

    respond_to do |format|
      if @qlink.update_attributes(params[:quick_link])
        format.html { redirect_to quick_links_path, :notice => t("successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @qlink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /business_categories/1
  # DELETE /business_categories/1.json
  def destroy
    @qlink = QuickLink.find(params[:id])
    @qlink.destroy

    respond_to do |format|
      format.html { redirect_to quick_links_url }
      format.json { head :no_content }
    end
  end
end
