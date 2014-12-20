require_relative 'chess_pieces'
require_relative 'chess_board'
require_relative 'human_player'
require 'colorize'
require 'io/console'

class NilPieceError < StandardError
end

class InvalidMoveError < StandardError
end

class CheckMateError < StandardError
end

class BadColorError < StandardError
end

class Game 
  
  def initialize
    @grid = Board.new
    @player_1 = Human.new(:g, @grid)
    @player_2 = Human.new(:b, @grid)
    @current_player = @player_1
    
  end
  
  def current_player_switch
    @current_player = (@current_player == @player_1 ? @player_2 : @player_1)
  end 
  
  def play
    system "clear"
    
    coord = [0, 0]
    @grid.print_board(coord)
    
    until @grid.checkmate?(:g) || @grid.checkmate?(:b)
      @current_player.play_turn(coord)
      # current_player_switch
    end
    
    @grid.checkmate?(:g) ? "Blue Wins!" : "Green Wins!"
  end
  
end

game = Game.new
game.play
