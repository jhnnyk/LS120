# -----------
# Exercise 2
module Run
  def run(speed)
    puts "I run #{speed}!"
  end
end

# ------------
# Exercise 1
class Runner
  include Run
end

john = Runner.new

john.run("fast")
