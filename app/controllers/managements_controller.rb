class ManagementsController < ApplicationController

  before_filter :checkCategory, :only => [:destroy_image]

  def checkCategory
    @category = params[:category]
    raise "Bad Category" if @category.nil?
  end
  
  def _index
    @category = params[:category]
    if !@category || @category.empty?
      logger.debug("@category is empty")
      respond_to do |format|
        format.html # index.html.erb
        return nil
      end
    end
    @@page = params[:page]
    logger.debug("category: #{@category} page: #{@@page}")
    @current_page = @@page.to_s
  end
  
  # ajax request
  # Delete an image
  def _destroy_image
    image = Image.find(params[:image])
    logger.info("Destroy Image: #{image} for #{@post}")
    image.destroy
  end
  
  protected
  
  MODELS = {:p_job => Job,
    :p_buy_and_sell => BuyAndSell,
    :p_wellbeing => WellBeing,
    :p_estate => Estate,
    :p_motor_vehicle => MotorVehicle,
    :p_business => Business,
    :p_accommodation => Accommodation,
    :p_law => Law, 
    :p_tax => Tax,
    :p_study => Study,
    :p_immig => Immigration,
    :p_yellowpage => BusinessClient,
    :p_sponsor => BusinessClient,
    :p_mypage => Mypage
  }
  
  def _model(category)
    model = MODELS[category.to_sym]
    raise "Bad Request for MODEL #{category}" if model.nil?
    model
  end
  
  def getPost(model, page, user=nil)
    if !user.nil?
      post = model.where("posted_by_id = ?", user).order.page page
    else
      post = model.order.page page
    end
    if post.empty? && page.to_i > 1
        post = model.order.page page.to_i - 1
    end
    post
  end

end
