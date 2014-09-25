require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test 'should not save without YouTube id' do
    video = Video.create

    assert_not video.save
  end

  test 'should not save with invalid YouTube id' do
    VCR.use_cassette 'video_model_invalid_id' do
      video = Video.create yt_id: 'aaaa'

      assert_not video.save
    end
  end

  test 'should not save without a channel' do
    VCR.use_cassette 'video_model_empty_channel' do
      video = Video.create yt_id: 'MESycYJytkU'

      assert_not video.save
    end
  end

  test 'should save when created via a channel' do
    VCR.use_cassette 'video_model_save' do
      channel = channels :fullscreen
      video = channel.videos.create yt_id: 'waa8JutImvY'

      assert video.save
    end
  end

  test 'should fetch video title' do
    VCR.use_cassette 'video_model_title' do
      channel = channels :fullscreen
      video = channel.videos.create yt_id: 'MESycYJytkU'

      assert_equal 'Fullscreen Creator Platform', video.title
    end
  end

  test 'should fetch video publication date' do
    VCR.use_cassette 'video_model_date' do
      channel = channels :fullscreen
      video = channel.videos.create yt_id: 'MESycYJytkU'
      publication_date = Time.parse('Tue, 09 Jul 2013 16:27:32 UTC +00:00')

      assert_equal publication_date, video.date
    end
  end

  test 'should fetch video thumbnail url' do
    VCR.use_cassette 'video_model_thumbnail' do
      channel = channels :fullscreen
      video = channel.videos.create yt_id: 'MESycYJytkU'

      assert_equal 'https://i.ytimg.com/vi/MESycYJytkU/hqdefault.jpg', video.thumbnail
    end
  end
end
