module ApplicationHelper
  def nav_link(link_text, link_path, link_params={}, icon_name=nil)
    class_name = current_page?(link_path) ? 'active' : ''
    html = ""

    content_tag(:li, :class => class_name) do
      link_to link_path, link_params do
        html << icon(icon_name) unless icon_name.nil?
        html << link_text
        html.html_safe
      end
    end
  end
end
