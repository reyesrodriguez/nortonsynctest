require 'csv'
namespace :db do
  task :import_csv => :environment do
    CSV.foreach("norton.csv", :headers => true) do |row|
      Song.create!(row.to_hash)
    end
  end
end