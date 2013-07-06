class Cell
  attr_accessor :label, :neighbours, :alive_neighbours_count, :dead_neighbours_count
  
  def initialize(label)
    @label = label
    @alive_neighbours_count = 0
    @dead_neighbours_count = 0   
  end

  def alive?
    label == 'X'
  end  

  def dead?
    !alive?
  end  
  
  def count_neighbour(alive)
   if alive
     self.alive_neighbours_count += 1  
   else
     self.dead_neighbours_count += 1
   end
  end

end  
