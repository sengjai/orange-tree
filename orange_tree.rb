class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :age
  attr_reader :height
  attr_reader :oranges

  def initialize (height=0,age=0)
    @oranges = [] #number of oranges in a tree
    @height = height #height of tree
    @age = age #age of tree
  end

  def age!
    #incrementing age
    @age += 1
    @height += rand(1..5).ceil if age < 5
    rand(1..10).times { @oranges << Orange.new(rand(1..3)).diameter } if @age > 5
  end

  def any_oranges?
    #return @oranges == [] ? false : true
    if @oranges == []
      return false
    else
      return true
    end
  end

  def pick_an_orange!
     raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?

     # orange-picking logic goes here
     @oranges.shift #delete an orange
  end

  def dead?
    #return @age > 10 ? true : false
    if @age > 10
      return true
    else
      return false
    end
  end

 
end

class Orange
  attr_reader :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end
end

tree = OrangeTree.new
tree.age! until tree.any_oranges?
puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []
  
  
    while tree.any_oranges?
      basket << tree.pick_an_orange!
    end
  
    if basket != []
      avg_diameter = ( basket.reduce(:+).to_f / basket.size ).round(2)
    else
      avg_diameter = 0
    end
  
    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
    puts ""
  
  
    tree.age!
  end
  
  puts "Alas, the tree, she is dead!"