class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.string :url
      t.datetime :last_fetched

      t.timestamps
    end
  end
end
