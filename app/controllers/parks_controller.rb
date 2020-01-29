class ParksController < ApplicationController
    def index
        parks = Park.all
        render json: parks.to_json(serialized_data)
    end
    private

    def serialized_data  
        {
            :except => [:created_at, :updated_at],
            :include =>  [
              :users => {:except => [:created_at, :updated_at]},
              :favorites   => {:except => [:created_at, :updated_at]}
            ]
        }
    end
end
