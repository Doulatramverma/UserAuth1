class Region < ApplicationRecord
	acts_as_commentable
   acts_as_votable
 has_many :regions, through: :user_regions 
  has_many :users, through: :user_regions

end
