class Human
  attr_reader :color
  
  def initialize(color, grid)
    @color = color
    @grid = grid
  end
  
  def color_message
    puts (@color == :g ? "Green Turn" : "Blue Turn")
  end
  
  def read_char
      STDIN.echo = false
      STDIN.raw!
      
      input = STDIN.getc.chr
      if input == "\e" then
          input << STDIN.read_nonblock(3) rescue nil
          input << STDIN.read_nonblock(2) rescue nil
      end
      ensure
      STDIN.echo = true
      STDIN.cooked!
      
      return input
  end
  
  def show_single_key
      c = read_char
      
      case c
          when " "
          :ret
          when "\n"
          :esc
          when "\e[A"
          :up
          when "\e[B"
          :down
          when "\e[C"
          :right
          when "\e[D"
          :left
      end
      
  end

  def play_turn(coord)
    begin 
      from = " "
      to = " "
      print "#{self.color == :g ? 'Green' : 'Blue'} Turn"
      from_message = "select a from move"
      to_message = "select a to move"
      print (self.color == :g ? from_message.green : from_message.blue)
      from = get_coord(coord)
      print (self.color == :g ? to_message.green : to_message.blue)
      to = get_coord(coord)
      @grid.move(from, to, @color)
    rescue NilPieceError
      "select a valid starting piece"
      retry
    rescue InvalidMoveError
      "select a valid move"
      retry
    rescue CheckMateError 
      "cannot move into checkmate"
      retry
    rescue BadColorError
      "choose your color to move"
      retry
    rescue
      retry
    end
    system "clear"
    @grid.print_board(coord)
  end
  
  def get_coord(coord) 
    move = []
      while move.empty?
        key = show_single_key
          if key == :down
            coord[0] += 1
          elsif key == :up
            coord[0] -= 1
          elsif key == :left
            coord[1] -= 1
          elsif key == :right
            coord[1] += 1
          elsif key == :ret
            move = coord.dup
          end
      
        system "clear"
        @grid.print_board(coord)  
      end
    return move
  end
  
end