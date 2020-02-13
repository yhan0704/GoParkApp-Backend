class User < ApplicationRecord
    has_many :favorites
    has_many :parks, through: :favorites

    validates :name, uniqueness: true
end
