class UsersController < ApplicationController
    def index
        users = User.all
        render json: users.to_json(serialized_data)
    end

    private

    def serialized_data  
        {
            :except => [:created_at, :updated_at],
            :include =>  [
              :favorites => {:except => [:created_at, :updated_at]},
              :parks   => {:except => [:created_at, :updated_at]}
            ]
        }
    end
end
