class Country < ApplicationRecord
	acts_as_commentable
	has_many :states
	has_many :cities
end
