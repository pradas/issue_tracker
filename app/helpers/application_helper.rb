module ApplicationHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end
    def byuser(title, user_id)
      link_to title, {:controller=>"/issues",:responsible => user_id}
    end
    def bykind(title, kind_req)
      link_to title, {:controller=>"/issues",:kind => kind_req}
    end
    def byprior(title, prior_req)
      link_to title, {:controller=>"/issues",:kind => prior_req}
    end
end
