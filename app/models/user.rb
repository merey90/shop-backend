class User < ActiveRecord::Base
  # include DeviseTokenAuth::Concerns::User

  has_and_belongs_to_many :product_varieties
  has_one :user_info
  has_one :role
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User
end
