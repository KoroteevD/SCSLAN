class ApplicationController < ActionController::Base
  
  protect_from_forgery

  before_filter :authenticate_user!, :only=>[:new,:create,:update,:destroy]

  def render_404
  	render 'public/404.html'
  end

end
