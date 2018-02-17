class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :redirect_www

  def redirect_www
  	if request.host == 'www.charlesharri.es'
  		redirect_to 'https://charlesharri.es'
  	end
  end

  def disable_header
    @disable_header = true
  end

  def disable_footer
    @disable_footer = true
  end
end
