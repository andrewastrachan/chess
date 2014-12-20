class Knight < SteppingPiece
  
  def directions
    KNIGHT
  end
  
  def inspect
     self.color == :g ? "\u265E".green :  "\u265E".blue
  end
  
end