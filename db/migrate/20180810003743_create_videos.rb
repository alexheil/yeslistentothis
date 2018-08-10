class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :user
      t.string :title
      t.string :video_data
      t.string :image_data
      t.text :description
      t.integer :votes
      t.datetime :start_time
      t.string :slug

      t.timestamps
    end
  end
end
