require 'yt'

class Channel < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  before_validation :fetch_title, on: :create

  protected
  def fetch_title
    unless self.url.nil?
      begin
        channel = Yt::Channel.new url: self.url
        self.title = channel.title
      rescue Yt::Error
        self.title = nil
        errors.add(:url, "must be a valid youtube channel url")
      end
    end
  end
end
