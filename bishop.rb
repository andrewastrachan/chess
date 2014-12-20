class Bishop < SlidingPiece
  
  def directions
    DIAGONALS
  end
  
  def inspect
    self.color == :g ? "\u265D".green :  "\u265D".blue
  end
  
end
