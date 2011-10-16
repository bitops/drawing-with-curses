require File.join('.', 'drawing')

class Rectangle < Drawing

	def initialize
		@column = 0
		@line = 0
		@width = 20
		@height = 10
	end

	def reset
		@column = 0
		@line = 0
	end

	def check_reset
		if @line > @height
			reset
			sleep 3
			clear
		end
	end

	def set_values
	  @column += 1
		if @column % @width == 0
			@line += 1
			@column = 0
		end	
	end

	def	draw
		check_reset
		if @line == 0 || @line == @height
			write(@line, @column, "+")
		else
			if @column == 0 || @column == @width - 1
				write(@line, @column, "+")
			else
				write(@line, @column, " ")
			end
		end
		set_values
	end

	def sleep_time
		0.02
	end
	
end

Rectangle.new.run
