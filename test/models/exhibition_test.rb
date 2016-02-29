require 'test_helper'

class ExhibitionTest < ActiveSupport::TestCase
  def setup
  	@exhibitionFalse = Exhibition.new()
  	@exhibit1 = exhibitions(:exhibit1)
  end

  test "should not be valid if missing any form fields for exhibition" do
  	assert_not @exhibitionFalse.valid?
  end

  test "should validate exhibition if all options are provided" do
  	assert @exhibit1.valid?
  end

  test "should have belongs_to museum association" do
  	assert_equal "Museum of Modern Art", @exhibit1.museum.name
  end
end