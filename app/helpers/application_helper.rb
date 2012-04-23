module ApplicationHelper

  def page_title
    (@content_for_title + " &mdash; " if @content_for_title).to_s + 'Pizzatown'
  end

  def create_select_options(items, item=nil, blank='Select one')
    if blank == false
      options = ''
    else
      options = "<option value=\"\">#{blank}</option>"
    end
    selected = ''
    items.each do |p|
      if item == p
        options << "<option selected=\"selected\" value=\"#{p}\">#{p}</option>"
      else
        options << "<option value=\"#{p}\">#{p}</option>"
      end
    end
    options
  end

end
