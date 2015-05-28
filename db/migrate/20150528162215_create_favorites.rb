class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :item_id
      t.string :item_name
      t.timestamps
    end
  end
end
