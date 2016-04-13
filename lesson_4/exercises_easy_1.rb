# Question 1
true.class
"hello".class
[1, 2, 3, "happy days"].class
142.class

# Question 2
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

sedan = Car.new
pickup = Truck.new

sedan.go_fast
pickup.go_fast

# Question 4
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

kitty = AngryCat.new

# Question 5
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables

# Question 6
class Cube
  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(5000)
big_cube.volume

# Question 8 & 9
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def make_one_year_older
    self.age += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Question 10
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new("black", "leather")
