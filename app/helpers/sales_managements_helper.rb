module SalesManagementsHelper
  def new_category_path(category, current_page)
    case @category
    when Okvalue::ESTATE
      return new_estate_path(:category => category, :page => current_page)
    when Okvalue::BUSINESS
       return new_business_path(:category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    end
  end

  def edit_category_path(category, item, current_page)
    case @category
    when Okvalue::ESTATE
      return edit_estate_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return edit_business_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    end
  end
  
  def show_category_parh(category, item, current_page)
    case @category
    when Okvalue::ESTATE
      return estate_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return business_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    end
  end
  
  def delete_category_path(category, item, current_page)
     case @category
    when Okvalue::ESTATE
      return estate_delete_path(item, :category => category, :page => current_page)
    when Okvalue::BUSINESS
      return business_delete_path(item, :category => category, :page => current_page)
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    end
  end
  
  def category_delete_image_path(category)
    case @category
    when Okvalue::ESTATE
      return estate_delete_image_path(item, :category => category)
    when Okvalue::BUSINESS
      return business_delete_image_path(item, :category => category)
    when Okvalue::MOTOR_VEHICLE
    when Okvalue::ACCOMMODATION
    when Okvalue::IMMIGRATION
    end
  end

end
