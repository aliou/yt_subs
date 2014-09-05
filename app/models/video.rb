class Video < ActiveRecord::Base
  validates :yt_id, presence: true, uniqueness: true

  BASE_URL = 'http://youtu.be/'

  # Public: Return the video URL.
  #
  # Returns the URL String.
  def url
    BASE_URL + self.yt_id
  end
end
