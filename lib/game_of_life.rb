class GameOfLife
  attr_accessor :x, :y, :cells, :errors, :interact_rules
  
  def initialize(x, y)
    @x = x 
    @y = y
    @cells = Array.new(x){ Array.new(y, nil) } 
    @errors = []
    @interact_rules = []
  end

  def add_rule(rule)
    interact_rules << rule
  end  

  def add_cell(x, y, cell)
    cells[x][y] = cell 
  end  
  
  def valid?
    validate_cells
    errors.empty?
  end  
 
  def play
    set_cell_neighbours_count
    self.cells = self.cells.map{ | arr_cells | arr_cells.map { |c| apply_interact_rules(c) } }
  end

  def display
    x.times{ |x_cord| puts cells[x_cord].collect(&:label).join(" ") }      
  end  

private
    
  def validate_cells
    errors.push "all positions are not filled." if cells.flatten.any?(&:nil?)
  end
      
  def set_cell_neighbours_count
    raise errors.join(',') if !valid?
    x.times do |x_cord|
      y.times do |y_cord|

        #horizontal neighbours
        cells[x_cord][y_cord].count_neighbour(cells[x_cord][y_cord - 1].alive?) if y_cord > 0
        cells[x_cord][y_cord].count_neighbour(cells[x_cord][y_cord + 1].alive?) if y_cord < y - 1

        #vertical neighbour
        cells[x_cord][y_cord].count_neighbour(cells[x_cord - 1][y_cord].alive?) if x_cord > 0
        cells[x_cord][y_cord].count_neighbour(cells[x_cord + 1][y_cord].alive?) if x_cord < x - 1

        #left diagonal neighbours
        cells[x_cord][y_cord].count_neighbour(cells[x_cord - 1][y_cord - 1].alive?) if x_cord > 0 && y_cord > 0
        cells[x_cord][y_cord].count_neighbour(cells[x_cord + 1][y_cord - 1].alive?) if x_cord < x - 1 && y_cord > 0

        #right diagonal neighbours
        cells[x_cord][y_cord].count_neighbour(cells[x_cord - 1][y_cord + 1].alive?) if x_cord > 0 && y_cord < y - 1
        cells[x_cord][y_cord].count_neighbour(cells[x_cord + 1][y_cord + 1].alive?) if x_cord < x - 1 && y_cord < y - 1

      end
    end
  end
  
  def apply_interact_rules(cell)
    interact_rules.each do |rule|
      cell = rule.apply(cell)
    end
    cell
  end
    
end  
