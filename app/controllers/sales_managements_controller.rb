class SalesManagementsController < ApplicationController
  # GET /sales_managements
  # GET /sales_managements.json
  def index
    @category = params[:category]
    if !@category || @category.empty?
      respond_to do |format|
        format.html # index.html.erb
        return 
      end
    end
    logger.debug("category: #{@category}")
    case @category
    when "estate"
      @collection = Estate.order.page params[:page]
    when "business"
    when "motor_vehicle"
    when "accommodation"
    else
      raise "Bad Category"
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collection }
    end
  end

end
