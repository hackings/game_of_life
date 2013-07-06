require 'test_helper'

class OverCrowdingTest <  MiniTest::Unit::TestCase
  
  def setup    
    @over_crowding = OverCrowding.new
  end  

  def test_cell_die_with_over_crowding
    alive_cell = Cell.new('X')
    alive_cell.alive_neighbours_count = 4
    alive_cell = @over_crowding.apply(alive_cell)
    assert alive_cell.dead?
  end

  def test_cell_not_die_with_over_crowding
    alive_cell = Cell.new('X')
    alive_cell.alive_neighbours_count = 3
    alive_cell = @over_crowding.apply(alive_cell)
    assert alive_cell.alive?
  end

end  
