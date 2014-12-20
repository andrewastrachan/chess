class Rook < SlidingPiece
  
  def directions
    HORIZONTALS
  end
  
  def inspect
     self.color == :g ? "\u265C".green :  "\u265C".blue
  end
end
