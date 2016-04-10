require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper? || other_move.spock?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.rock? || other_move.scissors?)) ||
      (spock? && (other_move.paper? || other_move.lizard?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def record_move
    @history << move
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or Spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    record_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    record_move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "---First to 10 wins!---"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won."
    else
      puts "It's a tie!"
    end
  end

  def keep_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "#{human.name}: #{human.score} | #{computer.name}: #{computer.score}"
  end

  def display_history
    puts "---Move History---"
    puts "--#{human.name}-- | --#{computer.name}--"
    i = 0
    loop do
      puts "#{human.history[i]}  |  #{computer.history[i]}"
      i += 1
      break if i == human.history.size
    end
  end

  def update_display
    display_moves
    display_history
    display_winner
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def reset_game
    human.score = 0
    computer.score = 0
    play
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      update_display
      keep_score
      display_score
      break if human.score == 10 || computer.score == 10
    end

    if play_again?
      reset_game
    else
      display_goodbye_message
    end
  end
end

RPSGame.new.play
