class UserRole < ApplicationRecord
	acts_as_commentable
	acts_as_votable
end
