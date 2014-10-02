class HomeController < ApplicationController
  # Show the last nine videos on the homepage.
  def index
    @videos = Video.order(date: :desc).take(9)
  end
end
