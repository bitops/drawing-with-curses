#!/usr/bin/env ruby
require 'curses'

# reading
# http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/

SHAPE = <<T
***
* *
***
T

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

def	draw
	Curses.refresh
end

VAR = 30

def	draw_stuff
		write(rand(VAR), rand(VAR * 2), "*")
		draw
		sleep 0.02
end

init_screen do
	count = 0
  loop do
		draw_stuff
		count += 1
		Curses.clear if count % 100 == 0
  end
end
