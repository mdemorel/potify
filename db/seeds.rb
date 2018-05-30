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

# plant = Plant.new(
#   name: ,
#   category: ,
#   description: ,
#   watering_frequency: ,
#   watering_quantity: ,
#   potting_frequency: ,
#   fertilizer_quantity: ,
#   fertilizer_frequency: ,
#   fertilizer_type: ,
#   exposition: ,
#   cutting_frequency: ,
#   temperature: ,
#   photo:
#   )


puts "scraping url from Houseplantexperts"

url = "https://www.houseplantsexpert.com/a-z-list-of-house-plants.html"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('ul#demoOne1 li a').each do |element|
  url = element.attributes["href"].value
  name = element.attributes["data-name"].value
  plant = Plant.new(plant_url: url, name: name)
  plant.save
end

puts "scraping information for each plant"


plant = Plant.first
url = plant.plant_url
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
image = html_doc.search('.img-responsive, .thumbnail > img, .thumbnail a > img, .carousel-inner > .item > img, .carousel-inner > .item > a > img').first
plant[:photo] = image.attributes["src"].value
plant[:description] =  html_doc.search('p').children.first.text
plant.save

Plant.all.each do |plant|
  url = plant.plant_url
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  image = html_doc.search('.img-responsive, .thumbnail > img, .thumbnail a > img, .carousel-inner > .item > img, .carousel-inner > .item > a > img').first
  plant[:photo] = image.attributes["src"].value
  plant[:description] =  html_doc.search('p').children.first.text
  plant[:watering_quantity] = 10
  plant[:watering_frequency] = 1
  plant[:potting_frequency] = 3
  plant[:fertilizer_frequency] = 2
  plant[:fertilizer_quantity] = 3
  plant[:fertilizer_type] = "indoor fertilizer"
  plant[:exposition] = 2
  plant[:cutting_frequency] = 4
  plant[:temperature] = 18
  plant.save
end




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


puts "scraping over!"


