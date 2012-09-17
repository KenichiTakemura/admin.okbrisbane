class WeathersController < ApplicationController

  def index
    get_information
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def collect
    ActiveRecord::Base.transaction do
      WeatherConfig.saveWeather      
    end
    get_information
    respond_to do |format|
      format.html { render :template => "weathers/index" }
    end
  end

  private
  
  def get_information
    @au_weather = Weather.weather_for(Common.today, Okvalue::AU)
    @kr_weather = Weather.weather_for(Common.today, Okvalue::KR)
    @au_dateOn = @au_weather.first.forecast_for if @au_weather.present?
    @kr_dateOn = @kr_weather.first.forecast_for if @kr_weather.present?
  end
  
end