require 'minitest/autorun'
require_relative '../libs/plateau'
require_relative '../libs/rover'
require_relative '../libs/direction'

class RoverTests < MiniTest::Test

	def setup
		@plateau = Plateau.new(5, 5)
		@validRover = Rover.new("x", 2, 1, "N", @plateau)
	end

	def test_InstantiateRover
		x = 2
		y = 4
		direction = Direction.new("N")
		pos_hash = {
				x: x,
				y: y,
				dir: direction
		}
		validRover = Rover.new("x", x, y, direction, @plateau)
		assert_equal validRover.position[:x], x
		assert_equal validRover.position[:y], y
		assert_equal validRover.position[:dir].to_s, direction.to_s
	end

	def test_InstantiateRoverOutOfBounds

		#x out of bounds
		x = -2
		y = 4
		direction = Direction.new("N")
		assert_raises RoverError do
			invalidRover = Rover.new("x", x, y, direction, @plateau)
		end

		x = 2
		y = 10
		assert_raises RoverError do
			invalidRover = Rover.new("x", x, y, direction, @plateau)
		end

		x = 2
		y = 2
		direction = "Z"

		assert_raises StandardError do
			invalidRover = Rover.new("x", x, y, direction, @plateau)
		end
	end

	def test_Turns
		@validRover.turn("R")
		assert_equal @validRover.position[:dir].to_s, "E"
		@validRover.turn("L")
		@validRover.turn("L")
		assert_equal @validRover.position[:dir].to_s, "W"
	end

	def test_MoveInBounds
		@validRover.move
		@validRover.move
		assert_equal @validRover.position[:y], 3
		assert_equal @validRover.position[:x], 2
	end

	def test_MoveOutOfBounds
		@validRover.move
		@validRover.move
		@validRover.move
		@validRover.move
		assert_raises RoverError do
			@validRover.move
		end
	end

end