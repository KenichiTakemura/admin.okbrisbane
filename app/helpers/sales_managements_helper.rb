module SalesManagementsHelper
  def new_category_path(category)
    case @category
    when "estate"
      return new_estate_path(:category => category)
    end
  end

  def edit_category_path(category, item)
    case @category
    when "estate"
      return edit_estate_path(item, :category => category)
    end
  end
  
  def show_category_parh(category, item)
    case @category
    when "estate"
      return estate_path(item, :category => category)
    end
  end

end
