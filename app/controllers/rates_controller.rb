class RatesController < ApplicationController

  def index
    get_information
    respond_to do |format|
      format.html # index.html.erb
    end
    @older_rates = Rate.all
  end
  
  def collect
    ActiveRecord::Base.transaction do
      RateConfig.saveRate
    end
    get_information
    respond_to do |format|
      format.html { render :template => "rates/index" }
    end
  end

  private
  
  def get_information
    @rates = Rate.rate_for
    @dateOn = Common.date_format_ymdhms(@rates.first.issuedOn) if @rates.present?
  end
  
end