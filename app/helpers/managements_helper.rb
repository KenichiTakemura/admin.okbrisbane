module ManagementsHelper
  def edit_post_path(category, item, current_page)
    case @category
    when Style.page(:p_job)
      return edit_job_path(item, :category => category, :page => current_page)
    when Style.page(:p_buy_and_sell)
      return edit_buy_and_sell_path(item, :category => category, :page => current_page)
    when Style.page(:p_well_being)
      return edit_well_being_path(item, :category => category, :page => current_page)
    when Style.page(:p_issue)
      return edit_issue_path(item, :category => category, :page => current_page)
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

  def show_post_path(category, item, current_page)
    case @category
    when Style.page(:p_job)
      return job_path(item, :category => category, :page => current_page)
    when Style.page(:p_buy_and_sell)
      return buy_and_sell_path(item, :category => category, :page => current_page)
    when Style.page(:p_well_being)
      return well_being_path(item, :category => category, :page => current_page)
    when Style.page(:p_issue)
      return issue_path(item, :category => category, :page => current_page)
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

  def management_path(category, page)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? @category
      return posts_managements_path(:category => @category, :page => @current_page)
    elsif [Style.page(:p_issue)].include? @category
      return issues_managements_path(:category => @category, :page => @current_page)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? @category
      return sales_managements_path(:category => @category, :page => @current_page)
    else
      raise "Bad Category"
    end
  end
  
  def show_management_path(item, category, page)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? @category
      return posts_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_issue)].include? @category
      return issues_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? @category
      return sales_management_path(item, :category => @category, :page => @current_page)
    else
      raise "Bad Category"
    end
  end

  def edit_management_path(item, category, page)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? @category
      return edit_posts_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_issue)].include? @category
      return edit_issues_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? @category
      return edit_sales_management_path(item, :category => @category, :page => @current_page)
    else
      raise "Bad Category"
    end
  end
  
  def delete_management_path(item, category, page)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? @category
      return posts_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_issue)].include? @category
      return issues_management_path(item, :category => @category, :page => @current_page)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? @category
      return sales_management_path(item, :category => @category, :page => @current_page)
    else
      raise "Bad Category"
    end
  end
  
  def delete_image_management_path(image_id, timestanp, post_id, category)
    if [Style.page(:p_job),Style.page(:p_buy_and_sell),Style.page(:p_well_being)].include? category
      return delete_image_posts_managements_path(:id => image_id, :t => timestamp, :post_id => post_id)
    elsif [Style.page(:p_issue)].include? category
      return delete_image_issues_managements_path(:id => image_id, :t => timestamp, :post_id => post_id)
    elsif [Style.page(:p_estate),Style.page(:p_business),Style.page(:p_motor_vehicle),Style.page(:p_accommodation),Style.page(:p_law),Style.page(:p_tax),Style.page(:p_study),Style.page(:p_immig)].include? category
      return delete_image_sales_managements_path(:id => image_id, :t => timestamp, :post_id => post_id)
    else
      raise "Bad Category"
    end
  end

end