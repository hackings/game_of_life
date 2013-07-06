require 'test_helper'

class GameOfLifeTest <  MiniTest::Unit::TestCase
  
  def setup
    @game = GameOfLife.new(2,2)  
  end  

  def test_add_interact_rule
    @game.add_rule(Loneliness.new)
    assert_equal 1, @game.interact_rules.count
  end
  
  def test_add_cell
    cell = Cell.new('X')
    @game.add_cell(0, 0, cell)
    assert_equal cell, @game.cells[0][0]
  end

  def test_game_is_valid
   cell = Cell.new('X')
   @game.add_cell(0, 0, cell) 
   @game.add_cell(0, 1, cell)
   @game.add_cell(1, 0, cell)
   @game.add_cell(1, 1, cell)
   assert @game.valid?
  end

  def test_validate_cells
    assert !@game.valid?
  end
  
  def test_set_neighbours_count
    add_cells
    setup_rules_and_play
    assert_equal 3, @game.cells[0][0].alive_neighbours_count    
    assert_equal 0, @game.cells[0][0].dead_neighbours_count
  end

  def test_apply_rules
  end

  def test_play
    add_cells
    setup_rules_and_play
    assert @game.cells[0][0].alive?
  end
   
  def test_play_with_invalid_game
    cell = Cell.new('X')
    @game.add_cell(0, 0, cell)
    assert_raises(RuntimeError) do 
      @game.play
    end
    assert !@game.errors.empty?
  end
  
  def test_block_pattern
    @game = GameOfLife.new(2, 2)
    @game.cells = [ [ Cell.new('X'), Cell.new('X') ], [ Cell.new('X'), Cell.new('X') ] ]
    setup_rules_and_play
    assert @game.cells.map{ |ar_cells| ar_cells.collect(&:label) }  == [ [ 'X', 'X' ], [ 'X', 'X' ] ]
  end   
  
  def test_bloat_pattern
    @game = GameOfLife.new(3, 3)
    @game.cells = [ [ Cell.new('X'), Cell.new('X'), Cell.new('-') ], [ Cell.new('X'), Cell.new('-'), Cell.new('X') ], [ Cell.new('-'), Cell.new('X'), Cell.new('-')] ]
    setup_rules_and_play
    assert @game.cells.map{ |ar_cells| ar_cells.collect(&:label) }  == [ [ 'X', 'X', '-' ], [ 'X', '-', 'X' ], [ '-', 'X', '-' ] ]
  end
  
  def test_blinker_pattern
    @game = GameOfLife.new(3, 3)
    @game.cells = [ [ Cell.new('-'), Cell.new('X'), Cell.new('-') ], [ Cell.new('-'), Cell.new('X'), Cell.new('-') ], [ Cell.new('-'), Cell.new('X'), Cell.new('-') ] ]
    setup_rules_and_play
    assert @game.cells.map{ |ar_cells| ar_cells.collect(&:label) }  == [ [ '-', '-', '-' ], [ 'X', 'X', 'X' ], [ '-', '-', '-' ] ]
  end

  def test_toad_pattern
    @game = GameOfLife.new(2, 4)
    @game.cells = [ [ Cell.new('-'), Cell.new('X'), Cell.new('X'), Cell.new('X') ], [ Cell.new('X'), Cell.new('X'), Cell.new('X'), Cell.new('-') ] ]
    setup_rules_and_play
    assert @game.cells.map{ |ar_cells| ar_cells.collect(&:label) }  == [ [ 'X', '-', '-', 'X' ], [ 'X', '-', '-', 'X' ] ]
  end
 
private 

  def add_cells
    cell = Cell.new('X')
    @game.add_cell(0, 0, cell)
    cell = Cell.new('X')
    @game.add_cell(0, 1, cell)
    cell = Cell.new('X')
    @game.add_cell(1, 0, cell)
    cell = Cell.new('X')
    @game.add_cell(1, 1, cell)
  end  

  def setup_rules_and_play
    @game.add_rule(Loneliness.new)
    @game.add_rule(OverCrowding.new)
    @game.add_rule(NextGeneration.new)
    @game.add_rule(Reproduction.new)
    @game.play
  end

end  
