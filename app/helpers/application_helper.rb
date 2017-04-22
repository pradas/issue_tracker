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
    
    def bykind(kind_req)
      if kind_req == "task" 
        icon = 'check'
      elsif kind_req == "bug" 
        icon = 'remove'
      elsif kind_req == "task" 
        icon = 'arrow-up'
      else
        icon = 'certificate'
      end
      link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe, {:controller=>"/issues",:kind => kind_req}
    end
      
      
      
    def byprior(prior_req)
      if prior_req == "minor"
        icon = 'step-backward'
      elsif prior_req == "major"
        icon ='forward'
      elsif prior_req == "trivial"
        icon ='fast-backward'
      elsif prior_req == "critical" 
        icon ='fast-forward'
      else
        icon ='ban-circle'
      end
      link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe, {:controller=>"/issues",:priority => prior_req}
    end
    
    def bystatus(status_req)
      if status_req == "new" 
        icon ='primary'
      elsif status_req == "resolved" || status_req == "closed" 
        icon ='success'
      elsif status_req == "open" 
        icon ='default'
      elsif status_req == "on hold" 
        icon ='warning'
      else  
        icon ='danger'
      end 
      link_to '<span class="label label-'.html_safe+icon.html_safe+'"> '.html_safe+status_req+'</span>'.html_safe, {:controller=>"/issues",:status => status_req}
      
    end
end
