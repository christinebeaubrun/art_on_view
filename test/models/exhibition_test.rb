# require 'test_helper'

# class ExhibitionTest < ActiveSupport::TestCase
#   def setup
#   	@exhibitionFalse = Exhibition.new(name: "The Bold and the Brave")
#   	@exhibition = Exhibition.new(
#   		name: "The Bold and the Brave",
#   		exhibit_date: "March 28 - August 1",
#   		about_info: "A show about the brave and the bold",
#   		img_url: 'https:www.google.com/image/wonders_of_the_world_a_second_time'
#   	)
#   end

#   test "should not be valid if missing any form fields for exhibition" do
#   	assert_not @exhibitionFalse.valid?
#   end

#   test "should validate exhibition if all options are provided" do
#   	assert @exhibition.valid?
#   end
# end