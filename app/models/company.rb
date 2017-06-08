class Company < ApplicationRecord
	
	acts_as_commentable
	acts_as_votable
     #has_many :comments
	has_many :countries
	has_many :states
	has_many :cities
end
