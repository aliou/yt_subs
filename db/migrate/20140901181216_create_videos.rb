class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :yt_id
      t.string :title
      t.timestamp :date

      t.timestamps
    end
  end
end
