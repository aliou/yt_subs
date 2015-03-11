require 'yt'

class Channel < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  before_validation :fetch_title, on: :create

  has_many :videos

  # Public: Fetch the last videos in the provided range.
  #
  # range - The range to get views from. By default it will be from the last
  #         fetched value to now.
  #
  # Returns the Videos fetched.
  def fetch_videos(range = nil)
    channel = Yt::Channel.new url: self.url
    range ||= self.last_fetched.to_datetime..DateTime.now

    videos = channel.videos.where(
      published_after: range.first,
      published_before: range.last
    )

    self.last_fetched = DateTime.now
    self.save

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
