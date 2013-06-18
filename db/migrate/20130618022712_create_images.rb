class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :category_id
      t.integer :width
      t.integer :height
      t.string :image_uid

      t.timestamps
    end
  end
end
