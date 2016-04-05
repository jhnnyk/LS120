class MyCar
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.mpg(miles_driven, gas_used)
    puts "#{miles_driven / gas_used} miles per gallon"
  end

  def to_s
    "This is a #{color} #{year} #{model}"
  end
end

MyCar.mpg(351, 13)
lumina = MyCar.new(1997, 'Lumina', 'white')
puts lumina
p lumina


# ---------------
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
p bob.name
