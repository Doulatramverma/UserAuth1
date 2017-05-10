class Place < ApplicationRecord
	has_one :node
	attr_accessor :node_name
end
