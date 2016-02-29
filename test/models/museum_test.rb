require 'test_helper'

class MuseumTest < ActiveSupport::TestCase
   def setup
  	@museumFalse = Museum.new()
  	@museum = museums(:moad)
  	@exhibit2 = exhibitions(:exhibit2)
  end

  test "should not validate if museum name or location are missing" do
  	assert_not @museumFalse.valid?
  end

  test "should validate museum if name, location, and city association are provided" do
  	assert @museum.save
  end

  test "should have an exhibition association" do
  	assert_equal [@exhibit2], @museum.exhibitions
  end

  test "should belong to a city" do
  	# print "Belong to city: #{@museum.city.name}"
  	assert_equal "San Francisco", @museum.city.name
  end
 
end
