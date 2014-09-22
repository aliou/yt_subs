require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test 'should not save without url' do
    channel = Channel.create
    assert_not channel.save
  end

  test 'should not save with invalid url' do
    VCR.use_cassette 'channel_model_invalid_url' do
      channel = Channel.create url: 'www.google.fr'
      assert_not channel.save
    end
  end

  test 'should fetch the channel title' do
    VCR.use_cassette 'channel_model_name' do
      channel = Channel.create url: 'youtube.com/fullscreen'
      assert_equal 'Fullscreen', channel.title
    end
  end

  test 'should respond to videos' do
    channel = channels :fullscreen
    assert channel.respond_to? :videos
  end

  test 'should fetch last videos' do
    VCR.use_cassette 'channel_model_fetch_videos' do
      channel = channels :caseyistat
      videos = channel.fetch_videos

      assert videos.any?
    end
  end
end
