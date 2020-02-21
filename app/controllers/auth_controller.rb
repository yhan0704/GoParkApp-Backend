class AuthController < ApplicationController

    def index
        users = User.all
        render json: users.to_json(serialized_data)
    end

    def create
        user = User.find_by(name: params[:username])
        if user && user.authenticate(params[:password])
            # byebug
                render json: user.to_json(serialized_data)
        else
            render json: {
                error:true,
            }, status: :bad_request
        end
    end

    private
    def serialized_data  
        {
            :except => [:created_at, :updated_at],
            :include =>  [ 
                :favorites => {:except => [:created_at, :updated_at], 
                    :include => [
                    :park => {:except => [:created_at, :updated_at]}
                    ]}
                ] 
            }
        
    end

end