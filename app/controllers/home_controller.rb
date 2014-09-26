class HomeController < ApplicationController

  # Show the last nine videos on the homepage by group of 3.
  def index
    @videos = Video.order(date: :desc).take(9).each_slice(3).to_a
  end
end
