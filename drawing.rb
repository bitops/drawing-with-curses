require 'curses'

class Drawing
  def write(line, column, text)
    Curses.setpos(line, column)
    Curses.addstr(text);
  end
  
  def init_screen
  	Curses.noecho
    Curses.init_screen
    begin
      yield
    ensure
      Curses.close_screen
    end
  end
  
  def display(shape)
    write 0,0, shape
  end
  
  def	refresh
  	Curses.refresh
  end

	def draw
		raise 'create subclass and implement'
	end

	#
	# Number of iterations before screen is cleared.
	# Return nil for 'never'.
	#
	def clear_count
		nil
	end

	def check_clear
		unless clear_count.nil?
			Curses.clear if @count % clear_count == 0
		end
	end
  
 	def run 
    init_screen do
    	@count = 0
      loop do
    		@count += 1
				draw
    		check_clear
      end
    end
	end
end

