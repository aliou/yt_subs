class HomeController < ApplicationController
  # Show the last five videos on the homepage.
  def index
    @videos = Video.order(date: :desc).take(5)
  end
end
