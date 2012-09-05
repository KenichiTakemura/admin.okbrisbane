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
  
  def update
    @system_setting = SystemSetting.find(params[:id])
    respond_to do |format|
      if @system_setting.update_attributes(params[:system_setting])
        format.html { redirect_to system_settings_path, :notice => t('successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @system_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
