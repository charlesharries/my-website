class StaticPagesController < ApplicationController

  before_filter :disable_header, :disable_footer, only: [:home]

  def home
  end

end
