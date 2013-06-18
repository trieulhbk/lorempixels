# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Image.delete_all
Category.delete_all



def make_category
  name = ['abstract','animals','business','cats','city','food','nightlife','fashion','people','nature','sports','technics','transport']
  i = 0
  while i < name.length do
    Category.create!(name: name[i])
    i += 1
  end
  puts 'make categories'
end

def make_images
  Category.all.each_with_index do |c,index|
    u = index + 1
    (1..5).each do |i|
      source = "http://localhost:8484/#{u}/#{i}.jpg"
      image = open(source)
      name = "c_#{i}"
      if !image.is_a? StringIO
        c.images.create(name: name,image_uid: image)
      end
    end
  end
  puts 'make images'
end



make_category
make_images



