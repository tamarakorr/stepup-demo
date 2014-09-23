module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "StepUp Demo"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Also see http://railscasts.com/episodes/228-sortable-table-columns

  
  def sortable(column, title = nil, to_be_persited_params = {})
    # to_be_persited_params is added to save existing parameters 
    #   in the url like in case of filters. e.g., user has filtered
    #     and then sorted, we want to sort over the filtered values.
    # 
    to_be_persited_params ||= {}
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    params_to_pass = to_be_persited_params.merge({:sort => column, :direction => direction})
    link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe,
      params_to_pass, {:class => css_class}
  end
end
