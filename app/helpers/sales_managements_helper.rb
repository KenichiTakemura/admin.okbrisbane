module SalesManagementsHelper

  def edit_category_path(category, item, current_page)
    case @category
    when Style.page(:p_estate)
      return edit_estate_path(item, :category => category, :page => current_page)
    when Style.page(:p_business)
      return edit_business_path(item, :category => category, :page => current_page)
    when Style.page(:p_motor_vehicle)
      return edit_motor_vehicle_path(item, :category => category, :page => current_page)
    when Style.page(:p_accommodation)
      return edit_accommodation_path(item, :category => category, :page => current_page)
    when Style.page(:p_law)
      return edit_legal_service_path(item, :category => category, :page => current_page)
    when Style.page(:p_tax)
      return edit_taxis_path(item, :category => category, :page => current_page)
    when Style.page(:p_study)
      return edit_study_path(item, :category => category, :page => current_page)
    when Style.page(:p_immig)
      return edit_immigration_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def show_category_path(category, item, current_page)
    logger.debug("show_category_path #{category} #{item} #{current_page}")
    case @category
    when Style.page(:p_estate)
      return estate_path(item, :category => category, :page => current_page)
    when Style.page(:p_business)
      return business_path(item, :category => category, :page => current_page)
    when Style.page(:p_motor_vehicle)
       return motor_vehicle_path(item, :category => category, :page => current_page)
    when Style.page(:p_accommodation)
       return accommodation_path(item, :category => category, :page => current_page)
    when Style.page(:p_law)
      return legal_service_path(item, :category => category, :page => current_page)
    when Style.page(:p_tax)
      return taxis_path(item, :category => category, :page => current_page)
    when Style.page(:p_study)
      return study_path(item, :category => category, :page => current_page)
    when Style.page(:p_immig)
      return immigration_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def category_delete_image_path(category)
    case @category
    when Style.page(:p_estate)
      return estate_delete_image_path(item, :category => category)
    when Style.page(:p_business)
      return business_delete_image_path(item, :category => category)
    when Style.page(:p_motor_vehicle)
      return motor_vehicle_delete_image_path(item, :category => category)
    when Style.page(:p_accommodation)
      return accommodation_delete_image_path(item, :category => category)
    when Style.page(:p_law)
      return legal_service_delete_iamge_path(item, :category => category, :page => current_page)
    when Style.page(:p_tax)
      return tax_delete_image_path(item, :category => category, :page => current_page)
    when Style.page(:p_study)
      return study_delete_image_path(item, :category => category, :page => current_page)
    when Style.page(:p_immig)
      return immigration_delete_image_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end

end
