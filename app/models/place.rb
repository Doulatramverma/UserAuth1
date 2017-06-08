class Place < ApplicationRecord
	acts_as_commentable
	acts_as_votable
	has_one :node
	attr_accessor :node_name
end
