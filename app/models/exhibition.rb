class Exhibition < ActiveRecord::Base
	belongs_to	:museum
	validates		:museum_id, presence: true
	
	validates 	:name, presence: true
	validates 	:exhibit_date, presence: true
	validates 	:about_url, presence: true
	validates 	:img_url, presence: true

end