module Swim
  def swim
    'swimming!'
  end
end

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
end

class Fish < Pet
  include Swim
end

class Mammals < Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Mammals
  include Swim

  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Mammals
  def speak
    'meow!'
  end
end

puts "---Cat lookup path---"
puts Cat.ancestors

puts "---Bulldog lookup path---"
puts Bulldog.ancestors

puts "---Fish lookup path---"
puts Fish.ancestors