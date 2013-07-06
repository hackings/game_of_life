class Reproduction
  def apply(cell)
    if cell.dead? && cell.alive_neighbours_count == 3
      cell.label = 'X'
    end  
    cell
  end  

end  
