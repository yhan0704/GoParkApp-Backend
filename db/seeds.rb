# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

User.destroy_all
Park.destroy_all
Favorite.destroy_all

states = ["md", "va", 'dc']

# parks_info = []

states.each do |state|
park_api = ENV["PARK_API_KEY"]
get_parks  = RestClient.get("https://developer.nps.gov/api/v1/parks?stateCode=#{state}&api_key=#{park_api}")
parks_info = JSON.parse(get_parks)["data"]
    # byebug
    parks_info.each do |park|
    Park.create(
        fullName:                       park["fullName"],
        states:                         park["states"],
        parkCode:                       park["parkCode"],
        weatherInfo:                    park["weatherInfo"],
        latLong:                        park["latLong"],
        image_url:                      park["image_url"],
        description:                    park["description"]
    )
    end
end



# young = User.create(name:"young", email:"asd@gmail.com", password:"1234")
# flatiron = Park.create(fullName:"flat", states:"va", parkCode:"awe", latLong:"fewa", image_url:"awef", description:"abemaria")
# fav= Favorite.create(visit:true, comment:"was nice", date:"2002-02-01", user_id:1, park_id:1)