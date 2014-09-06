require 'yt'

class Channel < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  before_validation :fetch_title, on: :create

  has_many :videos

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
        errors.add(:url, 'must be a valid youtube channel url')
      end
    end
  end
end
