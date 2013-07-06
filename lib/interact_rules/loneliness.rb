class Loneliness
  
  def apply(cell)
    if cell.alive? && cell.alive_neighbours_count < 2
      cell.label = '-'
    end
    cell  
  end  

end  
