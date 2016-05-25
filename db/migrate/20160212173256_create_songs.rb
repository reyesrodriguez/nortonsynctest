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


require 'csv'

def self.import(file)
  CSV.foreach("norton.csv", :headers => true) do |row|
    Songs.create!(row.to_hash)
  end
end
end
