class ApplicationController < ActionController::Base
  
  protect_from_forgery

  def render_404
  	render 'public/404.html'
  end

end
