class ParksController < ApplicationController
    def index
        parks = Park.all
        # byebug
        render json: parks.to_json(serialized_data)
    end

    def create
        
    end
    private

    def serialized_data  
        {
            :except => [:created_at, :updated_at],
            # :include =>  [
            #   :events => {:except => [:created_at, :updated_at]}  
            # ]            
        }
    end
end
