class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user
      t.references :video

      t.timestamps
    end
  end
end
