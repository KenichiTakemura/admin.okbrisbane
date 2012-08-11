module BannersHelper
  
  def _edit_common(p, s, a, b)
    div_id = Style.create_banner_div(p,s,a)
    html = %Q|<div class="edittable_banner" id="banner_edit_#{div_id}" style="#{b.style};">|
    html
  end
  
  def _title(b)
    "#{b.name} #{t("div_size")}:#{b.div_width}x#{b.div_height}<br/>#{t("image_size")}:#{b.img_width}x#{b.img_height}"
  end
  
  def _link_to(b)
     html = "<div>" + link_to(t('Show'), banner_path(b,:page_id => @page_id), :class => 'button') + "</div>"
     html += "<div>" + link_to(t('Edit'), edit_banner_path(b, :page_id => @page_id), :class => 'button') + "</div>"
     if !b.is_disabled
       html += "<div>" + link_to(t('select_image'), select_banners_path(:banner => b, :page_id => @page_id), :class => 'button') + "</div>"
     end
     html
  end
  
  def edittable_single_header_banner(a)
    edittable_single_banner(@page_name.to_sym, :s_header, a)
  end
  
  def edittable_single_body_banner(a)
    edittable_single_banner(@page_name.to_sym, :s_body, a)
  end
  
  def edittable_multi_body_banner(a)
    edittable_multi_banner(@page_name.to_sym, :s_body, a)
  end  
  
  def edittable_single_banner(p, s, a)
    b = getBanner(p,s,a)
    raise "Internal Error" if !b
    html = _edit_common(p, s, a, b)
    html += single_banner(p, s, a)
    html += %Q|<span>| + _title(b) + "<br/>" + _link_to(b) + %Q|</span>|
    html += "</div>"
    html.html_safe
  end
  
  def edittable_background_banner(a, lr)
    p = @page_name.to_sym
    s = :s_background
    b = getBanner(p, s, a)
    raise "Internal Error" if !b
    div_id = Style.create_banner_div(p, s, a)
    b.style =~ /^*top:[0-9]+*/
    top = $~.to_s.split(':').last.to_i  
    html = %Q|<div class="edittable_background_banner" id="banner_edit_#{div_id}" style="">|
    html += single_banner(p, s, a)
    html += %Q|<span>| + _title(b) + "<br/>" + _link_to(b) + %Q|</span>|
    html += "</div>"
    html.html_safe
  end
  
  def edittable_multi_banner(p, s, a)
    b = getBanner(p,s,a)
    raise "Internal Error" if !b
    html = _edit_common(p, s, a, b)
    html += multi_banner(p, s, a)
    html += %Q|<span>| + _title(b) + "<br/>" + _link_to(b) + %Q|</span>|
    html += %Q|</div>|
    html.html_safe
  end
  
  def getBanner(p,s,a)
    @banners.each do |banner|
      if banner.page_id == Style.pageid(p) && banner.section_id == Style.sectionid(s) && banner.position_id.to_i == a.to_i
        return banner
      end
    end
    raise "No banner space found for #{p} >> #{s} >> #{a}"
  end
  
  def flash?(client_image)
    html = ""
    if client_image.flash?
       html = image_tag("common/flash-seo.png", :size => "30x30")
    end
    html.html_safe
  end
end
