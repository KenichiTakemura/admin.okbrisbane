module PostManagementsHelper

  def edit_post_path(category, item, current_page)
    case @category
    when Style.page(:p_job)
      return edit_job_path(item, :category => category, :page => current_page)
    when Style.page(:p_buy_and_sell)
      return edit_buy_and_sell_path(item, :category => category, :page => current_page)
    when Style.page(:p_well_being)
      return edit_well_being_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def show_post_path(category, item, current_page)
    logger.debug("show_category_path #{category} #{item} #{current_page}")
    case @category
    when Style.page(:p_job)
      return job_path(item, :category => category, :page => current_page)
    when Style.page(:p_buy_and_sell)
      return buy_and_sell_path(item, :category => category, :page => current_page)
    when Style.page(:p_well_being)
      return well_being_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
    
  def post_delete_image_path(category)
    case @category
    when Style.page(:p_job)
      return job_delete_image_path(item, :category => category)
    when Style.page(:p_buy_and_sell)
      return buy_and_sell_delete_image_path(item, :category => category)
    when Style.page(:p_well_being)
      return well_being_delete_image_path(item, :category => category)
    else
      raise "Bad Category"
    end
  end

end