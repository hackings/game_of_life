Dir['./lib/**/*.rb'].each{|file| require file }

# Block Pattern #############################
puts "----------  Block Pattern  -----------"
g = GameOfLife.new(2, 2)
g.add_rule(Loneliness.new)
g.add_rule(OverCrowding.new)
g.add_rule(NextGeneration.new)
g.add_rule(Reproduction.new)


cell = Cell.new('X')
g.add_cell(0,0,cell)
cell = Cell.new('X')
g.add_cell(0,1,cell)
cell = Cell.new('X')
g.add_cell(1,0,cell)
cell = Cell.new('X')
g.add_cell(1,1,cell)

puts '(INPUT)'
g.display
g.play
puts '(OUTPUT)'
g.display
###########################################

#Bloat Pattern ###########################
puts "----------  Bloat Pattern  -----------"

g = GameOfLife.new(3, 3)
g.add_rule(Loneliness.new)
g.add_rule(OverCrowding.new)
g.add_rule(NextGeneration.new)
g.add_rule(Reproduction.new)


cell = Cell.new('X')
g.add_cell(0,0,cell)
cell = Cell.new('X')
g.add_cell(0,1,cell)
cell = Cell.new('-')
g.add_cell(0,2,cell)
cell = Cell.new('X')
g.add_cell(1,0,cell)
cell = Cell.new('-')
g.add_cell(1,1,cell)
cell = Cell.new('X')
g.add_cell(1,2,cell)
cell = Cell.new('-')
g.add_cell(2,0,cell)
cell = Cell.new('X')
g.add_cell(2,1,cell)
cell = Cell.new('-')
g.add_cell(2,2,cell)

puts '(INPUT)'
g.display
g.play

puts '(OUTPUT)'
g.display
########################################

# Blinker Pattern ######################

puts "---------- Blinker Pattern  ----------"

g = GameOfLife.new(3, 3)
g.add_rule(Loneliness.new)
g.add_rule(OverCrowding.new)
g.add_rule(NextGeneration.new)
g.add_rule(Reproduction.new)


cell = Cell.new('-')
g.add_cell(0,0,cell)
cell = Cell.new('X')
g.add_cell(0,1,cell)
cell = Cell.new('-')
g.add_cell(0,2,cell)
cell = Cell.new('-')
g.add_cell(1,0,cell)
cell = Cell.new('X')
g.add_cell(1,1,cell)
cell = Cell.new('-')
g.add_cell(1,2,cell)
cell = Cell.new('-')
g.add_cell(2,0,cell)
cell = Cell.new('X')
g.add_cell(2,1,cell)
cell = Cell.new('-')
g.add_cell(2,2,cell)

puts '(INPUT)'
g.display
g.play

puts '(OUTPUT)'
g.display
#####################################

# Toad Pattern ######################

puts "------------ Toad Pattern ------------"

g = GameOfLife.new(2, 4)
g.add_rule(Loneliness.new)
g.add_rule(OverCrowding.new)
g.add_rule(NextGeneration.new)
g.add_rule(Reproduction.new)


cell = Cell.new('-')
g.add_cell(0,0,cell)
cell = Cell.new('X')
g.add_cell(0,1,cell)
cell = Cell.new('X')
g.add_cell(0,2,cell)
cell = Cell.new('X')
g.add_cell(0,3,cell)
cell = Cell.new('X')
g.add_cell(1,0,cell)
cell = Cell.new('X')
g.add_cell(1,1,cell)
cell = Cell.new('X')
g.add_cell(1,2,cell)
cell = Cell.new('-')
g.add_cell(1,3,cell)

puts '(INPUT)'
g.display
g.play

puts '(OUTPUT)'
g.display



puts "--------------------------------------"


