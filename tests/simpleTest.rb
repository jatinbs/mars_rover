require 'minitest/autorun'
require_relative '../libs/plateau'
require_relative '../libs/rover'

class SimpleTest < MiniTest::Test

	def test_plateauCreation
		#random sizes
		x = 5
		y = 5
		plateau = Plateau.new(x, y)
		assert_equal plateau.x_size, x
		assert_equal plateau.y_size, y
	end

	def testRoverOriginalInput

		#create plateau
		x = 5
		y = 5
		plateau = Plateau.new(5, 5)

		#create rover
		x_pos = 1
		y_pos = 2
		dir = 1
		dir_str = "N"
		rover = Rover.new("r", x_pos, y_pos, dir_str, plateau)

		#cehck if x and y coordinates are set
		assert_equal rover.position[:x], x_pos
		assert_equal rover.position[:y], y_pos
		assert_equal rover.position[:dir].to_s, dir_str

		#move this rover according to the input string provided
		rover.move_by_string("LMLMLMLMM")
		assert_equal rover.position[:x], 1
		assert_equal rover.position[:y], 3
		assert_equal rover.position[:dir].to_s, "N"


		#create rover
		x_pos = 3
		y_pos = 3
		dir = 2
		dir_str = "E"
		rover = Rover.new("r", x_pos, y_pos, dir_str, plateau)

		#cehck if x and y coordinates are set
		assert_equal rover.position[:x], x_pos
		assert_equal rover.position[:y], y_pos
		assert_equal rover.position[:dir].to_s, dir_str

		#move this rover according to the input string provided
		rover.move_by_string("MMRMMRMRRM")
		assert_equal rover.position[:x], 5
		assert_equal rover.position[:y], 1
		assert_equal rover.position[:dir].to_s, "E"

	end

end