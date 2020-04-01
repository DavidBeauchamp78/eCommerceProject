class User < ApplicationRecord
    has_many :orders
    validates :name, :delivery_info, :password, presence: true
end
