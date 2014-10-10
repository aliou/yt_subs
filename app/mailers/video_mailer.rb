class VideoMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "YT <#{ENV['BOT_EMAIL']}>"
  default to:   User.first.email

  # Send the videos
  def send_videos(videos)
    @videos = videos
    mail subject: "YT new videos for #{ Date.today.to_s }"
  end
end
