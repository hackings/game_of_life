require 'test_helper'

class CellTest <  MiniTest::Unit::TestCase
  
  def setup
    @alive_cell = Cell.new('X')
    @dead_cell = Cell.new('-')
  end  
  
  def test_alive
    assert @alive_cell.alive?
  end 
  
  def test_dead
    assert @dead_cell.dead?
  end

  def test_count_neighbour
    @alive_cell.count_neighbour(@dead_cell.alive?)
    assert_equal 1, @alive_cell.dead_neighbours_count   
    
    @alive_cell.count_neighbour(@alive_cell.alive?)
    assert_equal 1, @alive_cell.alive_neighbours_count    
  end
  
end  
