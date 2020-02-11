class FavoritesController < ApplicationController
    def index
        favorites = Favorite.all
        render json: favorites.to_json(serialized_data)
    end

    def create
        favorite = Favorite.create(strong_params)
        # byebug
        render json: favorite.to_json(serialized_data)
    end

    private
    def strong_params
        params.require(:favorite).permit(:user_id, :park_id, :date, :visit, :comment)
    end

    def serialized_data  
        {
            :except => [:created_at, :updated_at],
            :include =>  [
                :user => {:except => [:created_at, :updated_at]}, 
                :park => {:except => [:created_at, :updated_at]} 
              ] 
        }
    end
end
