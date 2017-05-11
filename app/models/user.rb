class User < ApplicationRecord
	has_many :regions, through: :user_regions 
	has_many :images, :as=> :imageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
