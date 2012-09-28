class AdminNoticesController < ApplicationController

  def index
    @admin_notices = AdminNotice.order.page params[:page]
    respond_to do |format|
      format.html
    end
  end

  def show
    @admin_notice = AdminNotice.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admin_notice }
    end
  end

  def new
    @admin_notice = AdminNotice.new
    @admin_notice.build_content
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admin_notice }
    end
  end

  def edit
    @admin_notice = AdminNotice.find(params[:id])
  end

  def create
    @admin_notice = AdminNotice.new(params[:admin_notice])
    respond_to do |format|
      if @admin_notice.save
        @admin_notice.set_user(current_admin)
        format.html { redirect_to @admin_notice, :notice => t("successfully_created") }
        format.json { render :json => @admin_notice, :status => :created, :location => @admin_notice }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admin_notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @admin_notice = AdminNotice.find(params[:id])
    respond_to do |format|
      if @admin_notice.update_attributes(params[:admin_notice])
        format.html { redirect_to @admin_notice, :notice => t("successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admin_notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_notice = AdminNotice.find(params[:id])
    @admin_notice.destroy

    respond_to do |format|
      format.html { redirect_to admin_notices_url }
      format.json { head :no_content }
    end
  end
end
