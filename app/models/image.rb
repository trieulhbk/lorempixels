class Image < ActiveRecord::Base
  attr_accessible :category_id, :height, :name, :width,:image_uid

  mount_uploader :image_uid, ImageUploader

  belongs_to :category
end
