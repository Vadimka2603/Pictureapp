class AddPhotosCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photos_count, :integer
  end
end
