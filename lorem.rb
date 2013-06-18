require 'sinatra'
require 'pry'
require 'RMagick'

set :port, ENV['PORT'] || 5000

get /\/(.+)/ do
  p = params[:captures].first.split(/\//)

  width = (p.empty? ? 0 : i = p.shift).to_i > 1920 ? 0 : i.to_i
  height = (p.empty? ? 0 : i = p.shift).to_i > 1920 ? 0 : i.to_i
  category = p.empty? ? rand(0..13) : p.shift

  status 200

  src = Dir["public/#{category}/*"].shuffle.first

  if !src.nil? && width*height > 0
    headers "Content-Type" => "image/jpeg"
    image = Magick::Image.read(src).first
    @img = image.resize_to_fill(width,height)
    @img.to_blob
  else
    'Hello'
  end
end

