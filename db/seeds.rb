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
Event.destroy_all

states = ["md", "va", 'dc']

states.each do |state|
park_api = ENV["PARK_API_KEY"]
get_parks  = RestClient.get("https://developer.nps.gov/api/v1/parks?fields=images&stateCode=#{state}&api_key=#{park_api}")
parks_info = JSON.parse(get_parks)["data"]
parks_info.each do |park|
    if(park["images"].size == 0)
        next
    else
    Park.create!(
        fullName:                       park["fullName"],
        states:                         park["states"],
        parkCode:                       park["parkCode"],
        weatherInfo:                    park["weatherInfo"],
        latLong:                        park["latLong"],
        description:                    park["description"],
        image_url:                      park["images"][0]["url"]
        )
        end
        puts "#{park["images"][0]["url"]} was saved."
    end
end





states_event = ["md", "va", 'dc']
states_event.each do |state|
park_api = ENV["PARK_API_KEY"]
get_events  = RestClient.get("https://developer.nps.gov/api/v1/events?stateCode=#{state}&api_key=#{park_api}")
events_info = JSON.parse(get_events)["data"]
#  byebug
    events_info.each do |event|
    Event.create(
        sitecode:                       event["sitecode"],
        timestart:                      event["times"][0]["timestart"],
        timesend:                       event["times"][0]["timeend"],
        date:                           event["date"],
        free:                           event["isfree"],
    )
    end
end





# young = User.create(name:"young", email:"asd@gmail.com", password:"1234")
# flatiron = Park.create(fullName:"flat", states:"va", parkCode:"awe", latLong:"fewa", image_url:"awef", description:"abemaria")
# fav= Favorite.create(visit:true, comment:"was nice", date:"2002-02-01", user_id:3, park_id:309)