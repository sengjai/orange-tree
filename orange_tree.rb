# This is how you define your own custom exception classes
require 'byebug'

class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :age
  attr_reader :height
  attr_reader :oranges

  def initialize (height=0,age=0,oranges=5)
    @oranges = oranges #start with 5 oranges
    @height = height #height of tree
    @age = age #age of tree
    @dead = false
  end

  # Ages the tree one year
  def age!
    basket = []
    #incrementing age
    if @age <= 10
      @age = @age + 1
    else
      @dead = dead?() #die at age of 10
    end

    #incrementing height
    if @height >= 20
      #stop growing
    else
      height()
    end

    #incremeting oranges
    if @dead == false

      @oranges = @oranges + rand(10) #increase 5 oranges
      basket << @oranges
    else
      # say no more fruits
      @previous_oranges = @oranges
      @oranges = 0
    end

    #pick an orange at age of 5
    if @age >= 5 
      pick_an_orange!
    end
  end

  # Return the tree's current height
  def height
    @height = @height + 10
  end

  # Returns the tree's current age
  # def age
  #   return @age
  # end

  def dead?
    return true
  end
  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    if @oranges <= 0
      return true
    else
      return false
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?

    # orange-picking logic goes here

  end
end

class Orange
  attr_reader :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter=0)
    @diameter = diameter
    diameter_rand()
  end

  def diameter_rand()
    @diameter = rand(10)
  end
end

tree = OrangeTree.new

p tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"








