class StaticPagesController < ApplicationController

  before_filter :disable_header, :disable_footer, only: [:home]

  def home
    index = Random.rand(Dir.glob("app/assets/images/profile_pictures/*").length) + 1
    @image = "prof-#{index}.jpg"
  end

end
