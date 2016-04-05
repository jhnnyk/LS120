module FourWheelDriveable
  def four_wheel_drive
    "4x4 enabled!"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
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

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def age
    "Your #{self.model} is #{years_old} years_old"
  end

  private

  def years_old
    Time.now.year - self.year.to_i
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color} #{year} #{model}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include FourWheelDriveable

  def to_s
    "My truck is a #{color} #{year} #{model}"
  end
end

car = MyCar.new("2010", "Ford Focus", "white")
truck = MyTruck.new("2011", "Toyota Tundra", "gray")
another_car = MyCar.new("2000", "Toyota Land Cruiser", "silver")
puts car
puts truck
p Vehicle.number_of_vehicles
puts truck.four_wheel_drive

puts "---MyCar method lookup---"
puts MyCar.ancestors
puts "---MyTruck method lookup---"
puts MyTruck.ancestors
puts "---Vehicle method lookup---"
puts Vehicle.ancestors

puts truck.shut_off
puts truck.current_speed

puts truck.age

