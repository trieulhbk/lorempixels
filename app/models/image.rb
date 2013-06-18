class Image < ActiveRecord::Base
  attr_accessible :category_id, :height, :name, :width

  image_accessor :image
end