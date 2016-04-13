class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end
#
# bob = Person.new("Bob", 49)
# kim = Person.new("Kim", 33)
#
# puts "bob is older" if bob > kim
# puts "bob is older" if bob.>(kim)

# ---------------
# my_array = %w(hello world)
# my_array << "!!"
# puts my_array.inspect
#
# my_hash = {a: 1, b: 2, c: 3}
# my_hash << {d: 4}  # => NoMethodError

# ----------------
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowyboys")
cowboys.members << Person.new("Troy Aikman", 48)
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Michael Irvin", 49)

niners = Team.new("San Francisco 49ers")
niners.members << Person.new("Joe Montana", 59)
niners.members << Person.new("Jerry Rice", 52)
niners.members << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
# puts dream_team.inspect

# ------------------
# my_array = %w(first second third fourth)
# p my_array[2]
# p my_array.[](2)
#
# my_array[4] = "fifth"
# puts my_array.inspect
#
# my_array.[]=(5, "sixth")
# puts my_array.inspect

# ---------------------
p cowboys.members

p cowboys[1]
cowboys[3] = Person.new("JJ", 72)
p cowboys[3]
