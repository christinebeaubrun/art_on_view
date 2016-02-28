require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
  	@city1 = City.new()
  	@city2 = cities(:nyc)

  	@museum = museums(:moma)

  	@exhibition = exhibitions(:exhibit1)
  end

  test "should not instanciate a city without a name" do
		assert_not @city1.save
	end

	test "should save a city instant if name is provided" do
		assert @city2.save
	end

	test "should have museums" do
		assert_equal [@museum], @city2.museums
	end

	test "should have exhibitions through museum" do
		assert_equal [@exhibition], @city2.exhibitions
	end
end
