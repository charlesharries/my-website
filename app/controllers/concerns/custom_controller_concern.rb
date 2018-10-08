module CustomControllerConcern
  extend ActiveSupport::Concern

  included do
    helper_method :set_http_referer
  end

  def set_http_referer
    session[:return_to] = request.referer
  end
end