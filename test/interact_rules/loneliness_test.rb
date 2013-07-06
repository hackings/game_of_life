require 'test_helper'

class LonelinessTest <  MiniTest::Unit::TestCase
  
  def setup    
    @loneliness = Loneliness.new
  end  

  def test_cell_die_with_loneliness
    alive_cell = Cell.new('X')
    alive_cell = @loneliness.apply(alive_cell)
    assert alive_cell.dead?
  end

  def test_cell_not_die_with_loneliness
    alive_cell = Cell.new('X')
    alive_cell.alive_neighbours_count = 2
    alive_cell = @loneliness.apply(alive_cell)
    assert alive_cell.alive?
  end

end  
