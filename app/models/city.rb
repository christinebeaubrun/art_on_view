class City < ActiveRecord::Base
	validates :name, presence: true
	has_many	:museums
	has_many	:exhibitions, through: :museums
end
