class Company < ApplicationRecord
	acts_as_commentable
     #has_many :comments
	has_many :countries
	has_many :states
	has_many :cities
end
