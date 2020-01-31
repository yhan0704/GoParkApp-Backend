class ParkImagesController < ApplicationController
    
    def index
        park_images = ParkImage.all
        render json: park_images.to_json(serialized_data)
    end


    private

    def serialized_data  
        {
            :except => [:created_at, :updated_at]
        }
    end
end
