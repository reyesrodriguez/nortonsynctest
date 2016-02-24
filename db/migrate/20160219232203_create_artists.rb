class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :name
      t.text :photo
      t.text :biography
      t.text :song

      t.timestamps null: false
    end
  end
end
