require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test 'should not save without url' do
    channel = Channel.create
    assert_not channel.save
  end

  test 'should not save with invalid url' do
    channel = Channel.create url: 'www.google.fr'
    assert_not channel.save
  end

  test 'should fetch the channel title' do
    channel = Channel.create url: 'youtube.com/fullscreen'
    assert_equal 'Fullscreen', channel.title
  end

  test 'should respond to videos' do
    channel = channels :fullscreen
    assert channel.respond_to? :videos
  end
end
