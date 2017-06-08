class State < ApplicationRecord
	acts_as_commentable
	acts_as_votable
	has_many :cities
end
