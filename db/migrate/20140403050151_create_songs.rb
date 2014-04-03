class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :category
      t.boolean :favourite
      t.string :file

      t.timestamps
    end
  end
end
