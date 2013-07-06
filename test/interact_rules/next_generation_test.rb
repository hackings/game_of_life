require 'test_helper'

class NextGenerationTest <  MiniTest::Unit::TestCase
  
  def setup    
    @next_generation = NextGeneration.new
  end  

  def test_cell_remain_same_in_next_generation
    alive_cell = Cell.new('X') 
    alive_cell = @next_generation.apply(alive_cell)
    assert alive_cell.alive?
  end

  def test_cell_not_die_with_two_or_three_neighbours
    alive_cell = Cell.new('X')
    alive_cell.alive_neighbours_count = 2
    alive_cell = @next_generation.apply(alive_cell)
    assert alive_cell.alive?
    
    alive_cell.alive_neighbours_count = 3
    alive_cell = @next_generation.apply(alive_cell)
    assert alive_cell.alive?
  end

  
end  
