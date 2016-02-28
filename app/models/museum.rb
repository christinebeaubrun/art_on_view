class Museum < ActiveRecord::Base
	belongs_to	:city
	validates		:city_id, presence: true

	validates 	:name, presence: true
	validates 	:location, presence: true
	
	has_many		:exhibitions
end
