# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable
# end

# sparky = Dog.new
# neemo  = Fish.new
# paws   = Cat.new

# p sparky.swim
# p neemo.swim
# p paws.swim


# ----------------
# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors


# ------------
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')
kitty.say_name('kitty')

value = Mammal.some_out_of_place_method(4)
p value
