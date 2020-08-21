class Play
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    "#{player1} vs. #{player2}"
  end

  def take_a_turn
  end

  def end_game
  end
  
end
