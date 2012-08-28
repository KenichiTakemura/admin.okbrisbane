class SystemSettingsController < ApplicationController
  def index
    @system_settings = SystemSetting.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @system_settings }
    end
  end

  def edit
    @system_setting = SystemSetting.find(params[:id])
  end

end
