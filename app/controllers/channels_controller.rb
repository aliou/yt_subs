class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show]
  def index
    @channels = Channel.all
  end

  def show
  end

  private
  def set_channel
    @channel = Channel.where(id: params[:id]).first
  end
end
