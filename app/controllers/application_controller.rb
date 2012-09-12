class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_admin!, :set_locale

  before_filter :set_locale
  
  # Override
  def handle_unverified_request
   reset_session
   raise "Security Exception"
  end
  
  def set_locale
    #I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = params[:locale] || "ko"
  end

  def default_url_options(options={})
    #logger.debug "default_url_options is passed options: #{options.inspect}"
    { :locale => I18n.locale }
  end
  
  def rescue_action_in_public(exception)
     render :template=>"common/error"
  end
  
  def post_expiry
    system_setting = SystemSetting.first
    Common.current_time + system_setting.post_expiry_length.days
  end

end
