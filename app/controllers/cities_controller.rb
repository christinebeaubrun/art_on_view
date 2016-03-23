class CitiesController < ApplicationController
  def home
  	@cities = City.all
  	@exhibitionsCtn = []
  	@cities.each do | city |
  		@exhibitionsCtn.concat( city.exhibitions )
  	end
  	@exhibitionsCtn.shuffle!
  end
end
