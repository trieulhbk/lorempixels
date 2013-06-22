require 'sinatra'
require 'pry'
require 'RMagick'

set :port, ENV['PORT'] || 5000

get "/" do
  erb :index
end

get /\/(.+)/ do
  p = params[:captures].first.split("\/")
  options = p[0] =~ /\d/ ? nil : p.shift
  grey = options =~ /g/ ? true : false
  rs = options =~ /r/ ? true : false
  v = options =~ /v/ ? true : false
  width = (p.empty? ? 0 : i = p.shift).to_i > 1920 ? 0 : i.to_i
  height = (p.empty? ? 0 : i = p.shift).to_i > 1920 ? 0 : i.to_i
  category = p.empty? ? "*" : p.shift
  iid = p.empty? ? "*" : p.shift + ".*"
  status 200
  src = Dir["public/#{category}/#{iid}"].sample
  if !src.nil? && height*width > 0 && height+width > 0
    headers "Content-Type" => "image/jpeg"
    begin
      image = Magick::Image.read(src).first
      @img = image.resize_to_fill(width,height)
      @img = grey == true ? @img.quantize(256, Magick::GRAYColorspace) : @img
      @img = rs == true ? @img.raise : @img
      @img = v == true ? @img.vignette : @img
      @img.to_blob
    rescue
    end
  else
  end
end


