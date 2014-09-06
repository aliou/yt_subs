class HomeController < ApplicationController
  def index
    @videos = Video.where(date: 1.day.ago..Time.now)
      .order(date: :desc).take(5)
  end
end
