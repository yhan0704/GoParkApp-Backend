class User < ApplicationRecord
    has_many :favorites
    has_many :parks, through: :favorites
    has_secure_password
    validates_uniqueness_of :name, :case_sensitive => false
    validates_uniqueness_of :email, :case_sensitive => false
end
