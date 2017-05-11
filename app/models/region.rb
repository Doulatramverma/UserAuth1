class Region < ApplicationRecord
	 has_many :regions, through: :user_regions 
has_many :users, through: :user_regions

end
