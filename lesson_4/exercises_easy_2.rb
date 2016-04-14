# Question 1 & 2
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# Question 3
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

Orange.ancestors
HotSauce.ancestors

# Question 4
class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax."
  end
end

# Question 6
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer

# Question 7
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count
kitty = Cat.new("calico")
p Cat.cats_count

# Question 8
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

game_of_bingo = Bingo.new
p game_of_bingo.play

# Question 10
# better code organization
# DRY code
# easily creating reusable objects
# --- Launch School solution below ---
# Creating objects allow programmers to think more abstractly about the code they are writing.
# Objects are represented by nouns so are easier to conceptualize.
# It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
# It allows us to easily give functionality to different parts of an application without duplication.
# We can build applications faster as we can reuse pre-written code.
# As the software becomes more complex this complexity can be more easily managed.
