class AddNameToPublishers < ActiveRecord::Migration
  def change
	add_column :publishers,:name, :string, :limit => 255, :null => false, :unique => true
  end
end
