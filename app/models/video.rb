class Video < ActiveRecord::Base
  validates :yt_id, presence: true, uniqueness: true

  BASE_URL = 'http://youtu.be/'

  def url
    BASE_URL + self.yt_id
  end
end
