class Queen < SlidingPiece
  
  def directions 
    HORIZONTALS + DIAGONALS
  end
  
  def inspect
    self.color == :g ? "\u265B".green :  "\u265B".blue
  end
end