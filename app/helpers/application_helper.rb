module ApplicationHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, params.permit(:user_id,:status,:priority,:kind).merge(:sort => column, :direction => direction), {:class => css_class}
    end
    def byuser(title, user_id)
      link_to title, {:controller=>"/issues",:responsible => user_id}
    end
    
    def bykind(kind_req,text=nil)
      if kind_req == "task" 
        icon = 'check'
      elsif kind_req == "bug" 
        icon = 'remove'
      elsif kind_req == "task" 
        icon = 'arrow-up'
      else
        icon = 'certificate'
      end
      tag = text == true ? " "+kind_req : ''
      if(tag=='')
        link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe+tag.html_safe, params.permit(:user_id,:status,:priority).merge(:kind => kind_req)
      else
        link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe+tag.html_safe, {:controller=>"/issues",:kind => kind_req}
      end
    end

    def byprior(prior_req,text=nil)
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
      tag = text == true ? " "+prior_req : ''
      if(tag=='')
        link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe+tag.html_safe, params.permit(:user_id,:status,:kind).merge(:priority => prior_req)
      else
        link_to '<span class="glyphicon glyphicon-'.html_safe+icon.html_safe+'"></span>'.html_safe+tag.html_safe, {:controller=>"/issues",:priority => prior_req}
      end
    end
    
    def bystatus(status_req,text=nil)
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
      tag = text == true ? " "+status_req : ''
      if(tag=='')
        link_to '<span class="label label-'.html_safe+icon.html_safe+'"> '.html_safe+status_req+'</span>'.html_safe+tag.html_safe,  params.permit(:user_id,:priority,:kind).merge(:status => status_req)
      else
        link_to '<span class="label label-'.html_safe+icon.html_safe+'"> '.html_safe+status_req+'</span>'.html_safe+tag.html_safe,  {:controller=>"/issues",:status => status_req}
      end
    end
    
    def criteria_filter
      content = ""
      if params[:kind] != nil
        content += "<b>kind :</b>"+ params[:kind]+" "
      end
      if params[:priority] != nil
        content += "<b>priority :</b>"+ params[:priority]+" "
      end
      if params[:status] != nil
        content += "<b>status :</b>"+ params[:status]+" "
      end
      if params[:responsible] != nil
        content += "<b>responsible (id) :</b>"+ params[:responsible]
      end
      content.html_safe
    end

    def update_issue_field (field,value,button_class,title=nil)
      title ||= value
      button_to title, issue_path("issue["+field+"]"=>value), :method => :patch , :class => button_class
    end
    
    def remove_unwanted_words string
      bad_words = ["less than", "about"]
      
      bad_words.each do |bad|
        string.gsub!(bad + " ", '')
      end
      return string
    end
    

    
end
