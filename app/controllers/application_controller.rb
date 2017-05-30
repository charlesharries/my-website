class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def disable_header
    @disable_header = true
  end

  def disable_footer
    @disable_footer = true
  end
end
