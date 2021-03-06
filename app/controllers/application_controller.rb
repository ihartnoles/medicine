class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter CASClient::Frameworks::Rails::Filter

   #continue to use rescue_from in the same way as before
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found   
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end 
 
  #called by last route matching unmatched routes.  Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end
 
  #render 500 error 
  def render_error(e)

  	@title      = 'Error 500'
    @description = 'Internal Server Error'

    respond_to do |f| 
      f.html{ render :template => "static_pages/error_500_2", :status => 500 }
      #f.js{ render :partial => "errors/ajax_500", :status => 500 }
    end
  end
  
  #render 404 error 
  def render_not_found(e)
    respond_to do |f| 

      @title      = 'Error 404'
      @description = 'Page Not Found'

      f.html{ render :template => "static_pages/error_404_2", :status => 404 }
      #f.js{ render :partial => "errors/ajax_404", :status => 404 }
    end
  end

end
