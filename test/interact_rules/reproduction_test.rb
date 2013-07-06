require 'test_helper'

class ReproductionTest <  MiniTest::Unit::TestCase
  
  def setup    
    @reproduction = Reproduction.new
  end  

  def test_dead_cell_in_reproduction
    dead_cell = Cell.new('-')
    dead_cell.alive_neighbours_count = 3
    dead_cell = @reproduction.apply(dead_cell)
    assert dead_cell.alive?
  end

  def test_dead_cell_not_in_reproduction
    dead_cell = Cell.new('-')
    dead_cell = @reproduction.apply(dead_cell)
    assert dead_cell.dead?
  end

end  
