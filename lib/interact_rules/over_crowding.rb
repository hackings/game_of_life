class OverCrowding
  def apply(cell)
    if cell.alive? && cell.alive_neighbours_count > 3
      cell.label = '-'
    end  
    cell
  end  

end  
