class User < ApplicationRecord
    has_many :favorites
    has_many :parks, through: :favorites
end
