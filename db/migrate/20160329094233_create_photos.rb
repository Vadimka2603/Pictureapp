class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.string :picture
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :photos, :users
    add_index :photos, [:user_id, :created_at]
  end
end