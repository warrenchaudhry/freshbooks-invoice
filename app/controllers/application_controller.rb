class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #rescue_from SocketError, :with => :render_404
  before_filter :authenticate_connection
  helper_method :my_connection
  
  
  def my_connection
    authenticate_connection
  end
  
  def authenticate_connection
    con = FreshBooks::Client.new('inboxbusinesssolutions.freshbooks.com', 'a329d849b73d1ceb981607a064f2bda5')
    con
  end
  
  def render_404
    render :file => 'public/404.html'
  end
  
end
