class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :mixtape_id

      t.timestamps null: false
    end
  end
end
