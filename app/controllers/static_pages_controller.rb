class StaticPagesController < ApplicationController
  before_filter :disable_header, :disable_footer, only: [:home, :contact]

  def home
    index = Random.rand(Dir.glob("app/assets/images/profile_pictures/*").length) + 1
    @image = "prof-#{index}.jpg"
  end

  def contact
  end

  def resume
  end

  def toggle_dark_mode
    session[:dark_mode] = session[:dark_mode] ? false : true
    if !request.env['HTTP_REFERER'] || request.env['HTTP_REFERER'] = '#{root_url}/dark_mode'
      redirect_to posts_path
    else
      redirect_back fallback_location: posts_path
    end
  end

end
