class User < ActiveRecord::Base
  AUTHORIZED_USER = ENV['AUTHORIZED_USER']

  attr_accessor :name, :email

  validates :name, presence: true
end
