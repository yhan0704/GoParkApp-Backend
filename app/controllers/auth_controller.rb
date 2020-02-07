class AuthController < ApplicationController

    def index
        users = User.all
        render json: users.to_json
    end
    def create
        user = User.find_by(name: params[:username])
        render json: user.to_json
    end

end