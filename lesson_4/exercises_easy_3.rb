# Question 1 & 2
class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Hello.hi

# Question 3
class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

old_cat = AngryCat.new(43, "Sparky")
young_cat = AngryCat.new(2, "Sundial")

# old_cat.name
# old_cat.age
# young_cat.name
# young_cat.age

# Question 4
# class Cat
#   attr_reader :type
#
#   def initialize(type)
#     @type = type
#   end
#
#   def display_type
#     "I am a #{type} cat."
#   end
# end
#
# tabby = Cat.new("tabby")
# puts tabby.display_type

# Question 5
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
# tv.manufacturer
tv.model

Television.manufacturer
# Television.model

# Question 6
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# Question 7
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a color of green."
  end
end
