# class Person
#   attr_accessor :name

#   def ==(other)
#     name == other.name
#   end
# end

# bob = Person.new
# bob.name = "bob"

# bob2 = Person.new
# bob2.name = "bob"

# p bob == bob2

# bob_copy = bob
# p bob == bob_copy

num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end
