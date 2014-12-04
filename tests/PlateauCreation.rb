require 'minitest/autorun'
require_relative '../libs/plateau'

class PlateauCreation < MiniTest::Test

	def testRegularCreation

		# 5x5 plateau
		x = 5
		y = 5
		plateau = Plateau.new(x, y)
		assert_equal plateau.x_size, x
		assert_equal plateau.y_size, y

		#bigass plateau
		x = 12123213213
		y = 1231232
		plateau = Plateau.new(x, y)
		assert_equal plateau.x_size, x
		assert_equal plateau.y_size, y

	end

	def testZeroValCreation
		#x is 0
		x = 0
		y = 5
		assert_raise PlateauError do
			Plateau.new(x, y)
		end

		#y is 0
		x = 5
		y = 0
		assert_raise PlateauError do
			Plateau.new(x, y)
		end
	end

	def testNegValCreation

		#x is negative
		x = -1
		y = 5
		assert_raise PlateauError do
			Plateau.new(x, y)
		end

		#y is negative
		x = -1
		y = 5
		assert_raise PlateauError do
			Plateau.new(x, y)
		end
	end
end