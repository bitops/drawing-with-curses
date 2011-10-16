#!/usr/bin/env ruby
require 'curses'

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

init_screen do
  loop do
    display SHAPE
		Curses.refresh
  end
end
