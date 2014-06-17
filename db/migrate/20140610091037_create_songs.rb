class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :composer
      t.integer :movie_id
      t.timestamps
    end
  end
end
