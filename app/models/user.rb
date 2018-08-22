# User model with basic devise modules
class User < ApplicationRecord
  devise :database_authenticatable, :rememberable
end
