require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test 'should not save without YouTube id' do
    video = Video.create
    assert_not video.save
  end

  test 'should not save with invalid YouTube id' do
    video = Video.create yt_id: 'aaaa'
    assert_not video.save
  end

  test 'should not save without a channel' do
    video = Video.create yt_id: 'MESycYJytkU'
    assert_not video.save
  end

  test 'should save when created via a channel' do
    channel = channels :fullscreen
    video = channel.videos.create yt_id: 'waa8JutImvY'
    assert video.save, video.errors.messages.to_s
  end

  test 'should fetch video title' do
    channel = channels :fullscreen
    video = channel.videos.create yt_id: 'MESycYJytkU'
    assert_equal 'Fullscreen Creator Platform', video.title
  end
end
