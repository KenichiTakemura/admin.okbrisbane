module PostManagementsHelper
  def new_post_path(category, current_page)
    case @category
    when Style.page(:p_job)
      return new_job_path(:category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end

  def edit_post_path(category, item, current_page)
    case @category
    when Style.page(:p_job)
      return edit_job_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def show_post_path(category, item, current_page)
    logger.debug("show_category_path #{category} #{item} #{current_page}")
    case @category
    when Style.page(:p_job)
      return job_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def delete_post_path(category, item, current_page)
    case @category
    when Style.page(:p_job)
      return job_delete_path(item, :category => category, :page => current_page)
    else
      raise "Bad Category"
    end
  end
  
  def post_delete_image_path(category)
    case @category
    when Style.page(:p_job)
      return job_delete_image_path(item, :category => category)
    else
      raise "Bad Category"
    end
  end

end