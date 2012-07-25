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
    page = params[:page]
    logger.debug("category: #{@category} page: #{page}")
    case @category
    when Okvalue::ESTATE
      @post = Estate.order.page page
      if @post.empty? && page.to_i > 1
        @post = Estate.order.page page.to_i - 1
      end
    when Okvalue::BUSINESS
      @post = Business.order.page page
    when Okvalue::MOTOR_VEHICLE
      @post = MotorVehicle.order.page page
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    else
      raise "Bad Category"
    end
    @current_page = page.to_s
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end
  
  # ajax request
  # Delete an image
  def destroy_image
    @category = params[:category]
    raise "Bad Category" if @category.nil?
    case @category
    when Okvalue::ESTATE
      @post = Estate.find(params[:id])
    when Okvalue::BUSINESS
      @post = Business.find(params[:id])
    when Okvalue::MOTOR_VEHICLE
      @post = MotorVehicle.find(params[:id])
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
      raise "Bad Category"
    end
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
  end

end
