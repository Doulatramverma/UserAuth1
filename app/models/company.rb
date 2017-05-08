class Company < ApplicationRecord
	has_many :countries
	has_many :states
	has_many :cities
end
