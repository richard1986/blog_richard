class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, unless: -> { request.format.js? }

  before_action :authenticate_user!
  #before_action :authenticate_status!
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found 

  unless Rails.application.config.consider_all_requests_local
  	rescue_from Exception, :with => :render_error
      
  	rescue_from ActionController::UnknownFormat, :with => :render_not_found
  	rescue_from ActionController::RoutingError, :with => :render_not_found
  end

  def render_not_found
    redirect_to  rnf_path, :notice => {:class => "danger", :body => "This site is not available"}
  end

  protected
  

  def record_not_found(error)
    redirect_to root_url, :notice => {:class => "danger", :body => error.message}
  end
end
