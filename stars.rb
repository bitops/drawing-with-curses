require File.join('.', 'drawing')

class Stars < Drawing

	def	draw
		write(rand(30), rand(30* 2), "*")
	end
	
 	def clear_count
 		300
 	end

end

Stars.new.run
