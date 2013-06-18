class ImagesController < ApplicationController
  require 'RMagick'
  require 'base64'

  def show
    @image = Image.find(params[:id])
  end

  def download
    id = rand(Image.count) + 1
    image = Image.find(id)
    img_orig = Magick::Image.read(image.image_uid.path).first
    @img = img_orig.crop(0,0,params[:w].to_i,params[:h].to_i)

    send_data @img.to_blob, :type => "image/jpeg", :filename => "download"
  end

end
