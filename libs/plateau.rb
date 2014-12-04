require_relative "errors/PlateauError"

class Plateau

	#total size of plateau
	attr_reader :x_size
	attr_reader :y_size

	def initialize(x,y)

		x = x.to_i
		y = y.to_i

		#check if input is valid
		if x <= 0 || y <= 0
			raise PlateauError, "There is no fucking plateau."
		end

		# setting x and y sizes
		@x_size = x
		@y_size = y
	end
	
end