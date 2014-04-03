class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :category
      t.boolean :favourite
      t.string :url

      t.timestamps
    end
  end
end
