class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :user
      t.string :title
      t.string :artist
      t.string :track
      t.string :genre
      t.string :video_data
      t.string :image_data
      t.text :description
      t.integer :votes
      t.integer :views
      t.string :month
      t.string :day
      t.string :year
      t.datetime :start_time
      t.string :slug

      t.timestamps
    end
  end
end
