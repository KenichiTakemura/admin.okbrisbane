module ApplicationHelper
  
  def noimage
    html = <<-HTML
    <img src="/assets/noimage.jpg" width=50px height=50px/>
    HTML
    html.html_safe
  end
end
