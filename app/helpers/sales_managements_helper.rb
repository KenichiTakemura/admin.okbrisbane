module SalesManagementsHelper
  def new_category_path(category, current_page)
    case @category
    when Okvalue::ESTATE
      return new_estate_path(:category => category, :page => current_page)
    when Okvalue::BUSINESS
       return new_business_path(:category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
      return new_motor_vehicle_path(:category => category, :page => current_page)
    when Okvalue::ACCOMMODATION
      return new_accommodation_path(:category => category, :page => current_page)
    when Okvalue::LAW
      return new_legal_service_path(:category => category, :page => current_page)
    when Okvalue::STUDY
      return new_study_path(:category => category, :page => current_page)
    when Okvalue::IMMIGRATION
      return new_immigration_path(:category => category, :page => current_page)
    when Okvalue::TAX
      return new_tax_path(:category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end

  def edit_category_path(category, item, current_page)
    case @category
    when Okvalue::ESTATE
      return edit_estate_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return edit_business_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
      return edit_motor_vehicle_path(item, :category => category, :page => current_page)
    when Okvalue::ACCOMMODATION
      return edit_accommodation_path(item, :category => category, :page => current_page)
    when Okvalue::LAW
      return edit_legal_service_path(item, :category => category, :page => current_page)
    when Okvalue::STUDY
      return edit_study_path(item, :category => category, :page => current_page)
    when Okvalue::IMMIGRATION
      return edit_immigration_path(item, :category => category, :page => current_page)
    when Okvalue::TAX
      return edit_tax_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def show_category_path(category, item, current_page)
    logger.debug("show_category_path #{category} #{item} #{current_page}")
    case @category
    when Okvalue::ESTATE
      return estate_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return business_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
       return motor_vehicle_path(item, :category => category, :page => current_page)
    when Okvalue::ACCOMMODATION
       return accommodation_path(item, :category => category, :page => current_page)
    when Okvalue::LAW
      return legal_service_path(item, :category => category, :page => current_page)
    when Okvalue::STUDY
      return study_path(item, :category => category, :page => current_page)
    when Okvalue::IMMIGRATION
      return immigration_path(item, :category => category, :page => current_page)
    when Okvalue::TAX
      return tax_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def delete_category_path(category, item, current_page)
    case @category
    when Okvalue::ESTATE
      return estate_delete_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return business_delete_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
      return motor_vehicle_delete_path(item, :category => category, :page => current_page)
    when Okvalue::ACCOMMODATION
      return accommodation_delete_path(item, :category => category, :page => current_page)
    when Okvalue::LAW
      return legal_service_delete_path(item, :category => category, :page => current_page)
    when Okvalue::STUDY
      return study_delete_path(item, :category => category, :page => current_page)
    when Okvalue::IMMIGRATION
      return immigration_delete_path(item, :category => category, :page => current_page)
    when Okvalue::TAX
      return tax_delete_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def category_delete_image_path(category)
    case @category
    when Okvalue::ESTATE
      return estate_delete_image_path(item, :category => category)
    when Okvalue::BUSINESS
      return business_delete_image_path(item, :category => category)
    when Okvalue::MOTOR_VEHICLE
      return motor_vehicle_delete_image_path(item, :category => category)
    when Okvalue::ACCOMMODATION
      return accommodation_delete_image_path(item, :category => category)
    when Okvalue::LAW
      return legal_service_delete_iamge_path(item, :category => category, :page => current_page)
    when Okvalue::STUDY
      return study_delete_image_path(item, :category => category, :page => current_page)
    when Okvalue::IMMIGRATION
      return immigration_delete_image_path(item, :category => category, :page => current_page)
    when Okvalue::TAX
      return tax_delete_image_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end

end
