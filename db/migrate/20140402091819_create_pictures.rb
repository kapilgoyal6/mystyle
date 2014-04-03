class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.string :category
      t.boolean :favourite
      t.string :image

      t.timestamps
    end
  end
end
