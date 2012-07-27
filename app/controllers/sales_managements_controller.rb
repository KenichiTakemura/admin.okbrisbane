class SalesManagementsController < ManagementsController
  
  def index
    return if _index.nil?
    logger.debug("SalesManagementsController.index @category: #{@category}")
    case @category
    when Okvalue::ESTATE
      @post = getPost(Estate, @@page)
    when Okvalue::BUSINESS
      @post = getPost(Business, @@page)
    when Okvalue::MOTOR_VEHICLE
      @post = getPost(MotorVehicle, @@page)
    when Okvalue::ACCOMMODATION
      @post = getPost(Accommodation, @@page)
    when Okvalue::LAW
      @post = getPost(Law, @@page)
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
    case @category
    when Okvalue::ESTATE
      @post = Estate.find(params[:id])
    when Okvalue::BUSINESS
      @post = Business.find(params[:id])
    when Okvalue::MOTOR_VEHICLE
      @post = MotorVehicle.find(params[:id])
    when Okvalue::ACCOMMODATION
      @post = Accommodation.find(params[:id])
    when Okvalue::Law
      @post = Law.find(params[:id])
    else
      raise "Bad Category"
    end
    _destroy_image
  end
  
end
