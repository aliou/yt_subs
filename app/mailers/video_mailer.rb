class VideoMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "YT <#{ENV['BOT_EMAIL']}>"

  # Send the videos
  def send_videos(videos)
    @videos = videos
    mail subject: "YT new videos for #{ Date.today.to_s }", to: User.first.email
  end
end
