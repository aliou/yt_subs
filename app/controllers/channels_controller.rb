class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    @channels = Channel.all.sort do |a, b|
      a.title.downcase <=> b.title.downcase
    end
  end

  def show
    @videos = @channel.videos
  end

  def new
    @channel = Channel.new
  end

  def edit
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.last_fetched = 1.day.ago

    if @channel.save
      redirect_to @channel, notice: 'Channel was successfully created.'
    else
      render :new
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to @channel, notice: 'Channel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private

  # Private: Set current channel
  #
  # Returns Current Channel.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  # Private: Only allow the white listed params through.
  #
  # Returns Hash with the white listed params.
  def channel_params
    params.require(:channel).permit(:url)
  end
end
