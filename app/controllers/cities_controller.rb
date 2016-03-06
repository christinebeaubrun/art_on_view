class CitiesController < ApplicationController
  def home
  	@cities = City.all
  end
end
