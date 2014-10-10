namespace :scheduler do
  desc 'Send the videos since the last time they were fetched.'
  task :send_videos => :environment do
    videos = Channel.all.flat_map &:fetch_videos
    VideoMailer.send_videos(videos).deliver
  end
end
