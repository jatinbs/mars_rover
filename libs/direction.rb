class Direction

	def initialize(str)
		@dir_arr = ['N', 'E', 'S', 'W']
		@dir_hash = Hash[@dir_arr.map.with_index.to_a]
		if !@dir_hash[str]
			raise StandardError
		end
		@dir_int = @dir_hash[str]
	end

	def to_s
		@dir_arr[@dir_int]
	end

	def to_i
		@dir_int
	end

	def right
		@dir_int += 1
		@dir_int %= 4
	end

	def left
		@dir_int -= 1
		@dir_int %= 4
	end

	def turn(str)
		case(str)
		when "L"
			left
		when "R"
			right
		else
			raise StandardError, "No such direction!"
		end
	end

end