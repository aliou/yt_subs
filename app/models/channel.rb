require 'yt'

class Channel < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true

  before_validation :fetch_title, on: :create

  has_many :videos

  # Public: Fetch the last videos since the last time.
  #
  # Returns the Videos fetched.
  def fetch_videos
    channel = Yt::Channel.new url: self.url
    videos = channel.videos.where(
       published_after: self.last_fetched.to_datetime.rfc3339,
      published_before: DateTime.now.rfc3339
    )

    videos.map do |video|
      self.videos.create yt_id: video.id
    end
  end

  private

  # Private: Fetches the channel title from the YouTube API.
  #
  # Returns the title String or the error of type ActiveModel::Errors.
  def fetch_title
    unless self.url.nil?
      begin
        channel = Yt::Channel.new url: self.url
        self.title = channel.title
      rescue Yt::Error
        self.title = nil
        errors.add(:url, 'Must be a valid youtube channel url')
      end
    end
  end
end
