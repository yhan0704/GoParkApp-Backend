class UsersController < ApplicationController
    def index
        users = User.all
        render json: users.to_json(serialized_data)
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: User.find_by(name: params[:username])  
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
            :include =>  {
              :favorites => {:except => [:created_at, :updated_at]},
            }
        }
    end
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
