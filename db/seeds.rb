# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

puts "Destroying database"
Plant.destroy_all if Rails.env.development?
Pot.destroy_all if Rails.env.development?

puts "Scraping data"

# puts "scraping url from Houseplantexperts"

# url = "https://www.houseplantsexpert.com/a-z-list-of-house-plants.html"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search('ul#demoOne1 li a').each do |element|
#   url = element.attributes["href"].value
#   puts url
#   name = element.attributes["data-name"].value
#   plant = Plant.new(plant_url: url, name: name)
#   plant.save
# end

# puts "scraping information for each plant"


# plant = Plant.first
# url = plant.plant_url
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# image = html_doc.search('.img-responsive, .thumbnail > img, .thumbnail a > img, .carousel-inner > .item > img, .carousel-inner > .item > a > img').first
# plant[:photo] = image.attributes["src"].value
# plant[:description] =  html_doc.search('p').children.first.text
# plant.save

Plant.all.each do |plant|
  plant[:watering_quantity] = 10
  plant[:watering_frequency] = 1
  plant[:potting_frequency] = 3
  plant[:fertilizing_frequency] = 2
  plant[:fertilizing_quantity] = 3
  plant[:fertilizing_type] = "indoor fertilizer"
  plant[:exposition] = 2
  plant[:cutting_frequency] = 4
  plant[:temperature] = 18
  plant.save
end

# puts "scraping url from home-designing.com"

# url = "http://www.home-designing.com/best-low-light-indoor-house-plants-for-sale"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search('.gallery .gallery-item .gallery-icon .gallery-caption a').each do |element|
#   url = element.attributes["href"].value
#   name = element.inner_text
#   plant = Plant.new(plant_url: url, name: name)
#   plant.save
# end

# plant = Plant.first
# url = plant.plant_url
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# image = html_doc.search('.gallery-item a img, .simplepost a img, .gallery-item img').first
# plant[:photo] = image.attributes["src"].value
# puts plant[:photo]
# plant[:description] =  html_doc.search('gallery-caption').first.text


# scraping from houseplant411
# url = "https://www.houseplant411.com/houseplant/"
# plants_names = []

# for page in 1..14
#   # binding.pry
#   html_file = open(url + "page/#{page}").read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search('.resultsInd .resultsMid .resultName').each do |element|
#     plant = Plant.new(name: element.text.strip, plant_url: element.children.first.first[1])
#     # plants_names << plant.name
#     plant.save
#   end
# end

# Plant.all.each do |plant|
#   html_file = opent(plant.plant_url).read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search('.pagebanner').each do |element|

#   end
# end

pilea = Plant.new(name: "Pilea", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/Pilea-peperomioides-indoor-house-plant-600x904.jpg")
pilea.save

silver = Plant.new(name: "Silver", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/indoor-plants-Xerosicyos-danguyi-600x600.jpg")
silver.save

oxalis = Plant.new(name: "Oxalis", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/red-house-plant-Oxalis-triangularis-600x863.jpg")
oxalis.save

jade = Plant.new(name: "Jade", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/Crassula-ovata-jade-plant-600x816.jpg")
jade.save

zamioculcas = Plant.new(name: "Zamioculcas", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/Zamioculcas-zamiifolia-house-plant-inspiration-600x600.jpg")
zamioculcas.save

senecio = Plant.new(name: "Senecio rowleyanus", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/Senecio-rowleyanus-hanging-house-plant-600x800.jpg")
senecio.save

tillandsia = Plant.new(name: "Tillandsia", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/Tillandsia-oaxacana-planter-ideas-600x629.jpg")
tillandsia.save

opuntia = Plant.new(name: "Opuntia Cactus", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/indoor-cactus-Opuntia-microdasys-600x804.jpg")
opuntia.save

aloe = Plant.new(
  name: "Aloe Vera",
  description:"Besides being a popular ingredient in skincare products, Aloe plants are also extremely easy for even the most novice green thumb to keep alive. Plant these hardy ornamentals in cactus soil and place in a bright area for best results. They also make great gifts for friends who have trouble with other plants! They look great in just about any type of container and within any type of interior. They’re just that flexible.",
  photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/easy-houseplant-ideas-aloe-600x785.jpg",
  watering_quantity: 10,
  watering_frequency: 1,
  )
aloe.save

pothos = Plant.new(name: "Pothos", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/indoor-plant-with-vines-Epipremnum-aureum-600x600.jpg")
pothos.save

monstera = Plant.new(
  name: "Monstera Deliciosa",
  photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/tropical-plants-Monstera-deliciosa-600x600.jpg",
  description: "The scientific name Monstera deliciosa refers, in part, to the edible pineapple-like fruit this rainforest plant can provide – just make sure to read about how to ripen the fruits properly to avoid irritation upon consuming. These stunning large-leafed plants make a great statement piece and add warm, tropical appeal to any interior.",
  watering_frequency: 1,
  watering_quantity: 10,
  )
monstera.save

maranta = Plant.new(name: "Maranta", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/colorful-house-plant-Maranta-leuconeura-600x900.jpg")
maranta.save

fiddle = Plant.new(name: "Fiddle", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/big-indoor-plants-Ficus-lyrata-600x901.jpg")
fiddle.save

areca = Plant.new(name: "Areca Palm", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/large-house-plants-Dypsis-lutescens-600x899.jpg")
areca.save

calathea = Plant.new(name: "Calathea", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/indoor-plants-low-light-Calathea-Orbifolia-600x724.jpg")
calathea.save

strelitzia = Plant.new(name: "Strelitzia", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/large-house-plants-Strelitzia-nicolai-600x877.jpg")
strelitzia.save

colocasia = Plant.new(name: "Colocasia", photo: "http://cdn.home-designing.com/wp-content/uploads/2017/01/house-plants-online-Colocasia-gigantea-600x615.jpg")
colocasia.save

Plant.where("watering_frequency".nil?).each do |plant|
  plant[:watering_quantity] = 10
  plant[:watering_frequency] = 1
  plant[:potting_frequency] = 3
  plant[:fertilizing_frequency] = 2
  plant[:fertilizing_quantity] = 3
  plant[:fertilizing_type] = "indoor fertilizer"
  plant[:exposition] = 2
  plant[:cutting_frequency] = 4
  plant[:temperature] = 18
  plant.save
end

puts "scraping of plants over!"

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.name ,
    last_name: Faker::Name.last_name )
  user.save
end

puts "scraping of users over!"

