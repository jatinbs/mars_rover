require_relative 'direction'
require_relative 'plateau'
require_relative 'errors/RoverError'

class Rover

	attr_accessor :position

	def initialize(name, pos_x, pos_y, pos_dir, plateau)
		
		@plateau = plateau

		if pos_x.to_i < 0 || pos_x.to_i > @plateau.x_size || pos_y.to_i < 0 || pos_y.to_i > @plateau.y_size
			raise RoverError, "Instantiated out of plateau."
		end

		#store position
		@position = {
			x: pos_x.to_i,
			y: pos_y.to_i,
			dir: Direction.new(pos_dir.to_s)
		}

	end

	def move
		#check for colission
		case @position[:dir].to_i
		when 0
			if @position[:y] >= @plateau.y_size
				raise RoverError, "Going out of bounds."
			end
			@position[:y] += 1
		when 1
			if @position[:x] >= @plateau.x_size
				raise RoverError, "Going out of bounds."
			end
			@position[:x] += 1
		when 2
			if @position[:y] <= 0
				raise RoverError, "Going out of bounds."
			end
			@position[:y] -= 1
		when 3
			if @position[:x] <= 0
				raise RoverError, "Going out of bounds."
			end
			@position[:x] -= 1
		end
	end

	def turn(str)
		@position[:dir].turn(str)
	end

	def move_by_string(str)
		str.each_char do |command|
			case command
			when 'M'
				move
			when 'L'
				turn(command)
			when 'R'
				turn(command)
			else

			end
		end
	end

	def get_output
		return "#{@position[:x]} #{@position[:y]} #{@position[:dir]}"
	end

end