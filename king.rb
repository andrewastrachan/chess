class King < SteppingPiece

  def directions
    KING
  end
  
  def inspect
    self.color == :g ? "\u265A".green :  "\u265A".blue
  end
  
  
end