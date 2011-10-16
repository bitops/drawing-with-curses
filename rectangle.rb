require File.join('.', 'drawing')

class Rectangle < Drawing

	def initialize
		@origin = 0
		@column = @origin
		@line = @origin
		@width = 20
		@height = 10
	end

	def reset
		@origin = rand(20) + 1 # y'know, in case of zero.
		@column = @origin
		@line = @origin
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
			@column = @origin
		end	
	end

	def	draw
		check_reset
		if @line == @origin || @line == @height
			write(@line, @column, "+")
		else
			if @column == @origin || @column == @width - 1
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
