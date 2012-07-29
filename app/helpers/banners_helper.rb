module BannersHelper
  
  def _edit_common(p, s, a)
    b = getBanner(p,s,a)
    raise "Internal Error" if !b
    div_id = Style.create_banner_div(p,s,a)
    html = %Q|<div class="shadow" id="banner_edit_#{div_id}" style="#{b.style};">|
    html += %Q|<div style="position:relative;top:0px;left:0px;color:black;background-color:white">| + _title(b) + %Q|</div>|
    html += %Q|<div style="position:relative;top:0px;right:0px;height:20px;font-style:bold;font-size:10px">| + _link_to(b) + %Q|</div>|
    html
  end
  
  def _title(b)
    "#{b.name} #{t("div_size")}:#{b.div_width}x#{b.div_height} #{t("image_size")}:#{b.img_width}x#{b.img_height}"
  end
  
  def _link_to(b)
     link_to(t('Show'), banner_path(b,:page_id => @page_id), :class => 'button') +
      link_to(t('Edit'), edit_banner_path(b, :page_id => @page_id), :class => 'button') +
      link_to(t('select_image'), select_banners_path(:banner => b, :page_id => @page_id), :class => 'button')
  end
  
  def edittable_single_banner(p, s, a)
    html = _edit_common(p, s, a)
    html += single_banner(p, s, a)
    html += "</div>"
    html.html_safe
  end
  
  def edittable_background_banner(p, s, a, lr)
    b = getBanner(p,s,a)
    raise "Internal Error" if !b
    div_id = Style.create_banner_div(p,s,a)
    if lr == "left"
      html = %Q|<div style="position:relative;top:0px;float:right;width:100px;color:black;background-color:white">| + _title(b) + %Q|</div>|
      html += %Q|<div style="position:relative;top:0px;float:right;width:100px;font-style:bold;font-size:10px">| + _link_to(b)  + %Q|</div>|
    else
      html = %Q|<div style="position:relative;top:0px;float:left;width:100px;color:black;background-color:white">| + _title(b) + %Q|</div>|
      html += %Q|<div style="position:relative;top:0px;float:left;width:100px;font-style:bold;font-size:10px">| + _link_to(b) + %Q|</div>|
    end      
    html += single_banner(p, s, a)
    #html += "</div>"
    html.html_safe
  end
  
  def edittable_multi_banner(p, s, a)
    html = _edit_common(p, s, a)
    html += multi_banner(p, s, a)
    html += %Q|</div>|
    html.html_safe
  end
  
  def getBanner(p,s,a)
    @banners.each do |banner|
      if banner.page.name == Style::PAGES[p] && banner.section.name == Style::SECTIONS[s] && banner.position_id.to_i == a.to_i
        return banner
      end
    end
    raise "No banner space found"
  end
end
