class AddImageUidToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_uid, :string
  end
end
