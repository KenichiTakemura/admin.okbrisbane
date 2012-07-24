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
    when Okvalue::ESTATE
      @post = Estate.order.page params[:page]
    when Okvalue::BUSINESS
      @post = Business.order.page params[:page]
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    else
      raise "Bad Category"
    end
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
    @post = Estate.find(params[:id])
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
    #respond_to do |format|
    #  format.html { render :template => "sales_managements/destroy_image" }
    #end
   #render :json => {:result => "OK"}
    #respond_to do |format|
    #  format.html { redirect_to sales_managements_url(:category => 'estate') }
    #  format.json { head :no_content }
    #end
    #ender(:new) do |page|
    #  page.replace_html 'thumbnail_box', 'OK'
    #end
  end

end
