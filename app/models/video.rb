class Video < ActiveRecord::Base
  BASE_URL = 'http://youtu.be/'

  belongs_to :channel

  validates :yt_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :channel_id, presence: true

  before_validation :fetch_informations, on: :create

  # Public: Return the video URL.
  #
  # Returns the URL String.
  def url
    BASE_URL + self.yt_id
  end

  private

  def fetch_informations
    unless self.yt_id.nil? or self.title.present?
      begin
        video = Yt::Video.new id: self.yt_id
        self.title = video.title
        self.date = video.published_at
      rescue
        self.title = nil
        errors.add(:yt_id, 'Must be a valid youtube video id')
      end
    end
  end
end
