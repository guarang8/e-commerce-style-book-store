class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, :limit => 255, :null => false
      t.integer :publisher_id, :null => false
      t.datetime :published_at
      t.string :isbn, :limit => 13, :unique => true
      t.text :blurb
      t.integer :page_count
      t.float :price

      t.timestamps
    end
  end
end
