require 'rest-client'
require 'unsplash'
require 'byebug'

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
    if(park["images"].size == 0 || park["images"].size == 1)
        next
    else
    Park.create!(
        fullName:                       park["fullName"],
        states:                         park["states"],
        parkCode:                       park["parkCode"],
        weatherInfo:                    park["weatherInfo"],
        latLong:                        park["latLong"],
        description:                    park["description"],
        image_url:                      park["images"][1]["url"]
        )
        end
    end
end





states_event = ["md", "va", 'dc']
states_event.each do |state|
park_api = ENV["PARK_API_KEY"]
get_events  = RestClient.get("https://developer.nps.gov/api/v1/events?stateCode=#{state}&api_key=#{park_api}")
events_info = JSON.parse(get_events)["data"]
    events_info.each do |event|
        # byebug
        Event.create(
            park:                           Park.find_by(parkCode: event["sitecode"]),
            contactname:                    event["contactname"],
            contactemailaddress:            event["contactemailaddress"],
            parkCode:                       event["sitecode"],
            timestart:                      event["times"][0]["timestart"],
            timesend:                       event["times"][0]["timeend"],
            date:                           event["date"],
            free:                           event["isfree"],
            )
    end
end

image_api = ENV["SPLASH_API_KEY"]
get_image  = RestClient.get("https://api.unsplash.com/search/photos?query=trees/&client_id=#{image_api}")
images = JSON.parse(get_image)["results"]
    images.each do |image|
    ParkImage.create(
        image_url:                       image["urls"]["small"]
    )
end




# young = User.create(name:"young", email:"asd@gmail.com", password:"1234")
# flatiron = Park.create(fullName:"flat", states:"va", parkCode:"awe", latLong:"fewa", description:"abemaria")
# fav= Favorite.create(visit:true, comment:"was nice", date:"2002-02-01", user_id:1, park_id:73)