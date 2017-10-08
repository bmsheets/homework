class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Welcome to Simon Says!"
    until game_over
        take_turn
    end
    game_over_message
  end

  def take_turn
    puts "Remember the following sequence!"
    sleep(2)
    system("clear")
    show_sequence
    puts "Now type in the color sequence."
    require_sequence
    round_success_message unless game_over
  end

  def show_sequence
    add_random_color
    seq.each_with_index do |color, idx|
        puts "#{idx + 1}: #{color}"
        sleep(1)
        system("clear")
    end
  end

  def require_sequence
    given_colors = []
    sequence_length.times do |idx|
        given_colors << get_input
        if seq[idx] != given_colors[idx]
            @game_over = true
            return
        end
    end
  end

  def get_input
    input = gets.chomp
    until valid_input?(input)
        puts "Invalid color. Choose from red, yellow, green, and blue."
        input = gets.chomp
    end
    input
  end

  def valid_input?(input)
    COLORS.index(input)
  end

  def add_random_color
    seq << COLORS.sample
    @sequence_length = seq.length
  end

  def round_success_message
    puts "Good job you passed that round."
  end

  def game_over_message
    puts "Game over. You made it #{sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end

if __FILE__ == $PROGRAM_NAME
    game = Simon.new
    game.play
end
