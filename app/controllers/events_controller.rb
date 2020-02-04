class EventsController < ApplicationController
    def index
        events = Event.all
        render json: events.to_json(serialized_data)
    end
    
    private

    def serialized_data  
        {
            :except => [:created_at, :updated_at]
        }
    end
end
