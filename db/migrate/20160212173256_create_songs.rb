class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :catalogue
      t.string :writer
      t.string :publisher
      t.string :theme

      t.timestamps null: false
    end
  end
end
