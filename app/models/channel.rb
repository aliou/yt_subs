require 'yt'

class Channel < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true
end
