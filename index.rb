require_relative "libs/plateau.rb"
require_relative "libs/rover.rb"
require_relative "libs/direction.rb"

#file input
input_arr = File.open("input.txt")

#initialize variables for the sake of scope
plateau = nil
rover = nil


input_arr.each.with_index do |line, line_num|
	case line_num
	when 0
		#first line is creation of plateau
		plateau = Plateau.new(line[0], line[2])
	else
		#alternate lines create and move rover
		case line_num%2
		when 1
			#instantiate rover
			rover = Rover.new("r", line[0], line[2], line[4], plateau)
		when 0
			#move rover
			rover.move_by_string(line)
			puts rover.get_output
		end
	end
end