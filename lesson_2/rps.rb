require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def >(other_move)
    (is_a?(Rock) && (other_move.is_a?(Scissors) || other_move.is_a?(Lizard))) ||
      (is_a?(Paper) && (other_move.is_a?(Rock) || other_move.is_a?(Spock))) ||
      (is_a?(Scissors) && (other_move.is_a?(Paper) || other_move.is_a?(Lizard))) ||
      (is_a?(Lizard) && (other_move.is_a?(Paper) || other_move.is_a?(Spock))) ||
      (is_a?(Spock) && (other_move.is_a?(Rock) || other_move.is_a?(Scissors)))
  end

  def <(other_move)
    (is_a?(Rock) && (other_move.is_a?(Paper) || other_move.is_a?(Spock))) ||
      (is_a?(Paper) && (other_move.is_a?(Scissors) || other_move.is_a?(Lizard))) ||
      (is_a?(Scissors) && (other_move.is_a?(Rock) || other_move.is_a?(Spock))) ||
      (is_a?(Lizard) && (other_move.is_a?(Rock) || other_move.is_a?(Scissors))) ||
      (is_a?(Spock) && (other_move.is_a?(Paper) || other_move.is_a?(Lizard)))
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
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

    self.move = case choice
                when 'rock'
                  Rock.new
                when 'paper'
                  Paper.new
                when 'scissors'
                  Scissors.new
                when 'lizard'
                  Lizard.new
                when 'spock'
                  Spock.new
                end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    value = Move::VALUES.sample

    self.move = case value
                when 'rock'
                  Rock.new
                when 'paper'
                  Paper.new
                when 'scissors'
                  Scissors.new
                when 'lizard'
                  Lizard.new
                when 'spock'
                  Spock.new
                end
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
      display_moves
      display_winner
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
