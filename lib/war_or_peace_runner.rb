class Game
  attr_reader :deck, :hand1, :hand2
  def initialize
    @deck = []
    @hand1 =[]
    @hand2 = []
  end

    SUIT_CONSTANT = [:heart, :diamond, :club, :spade]
    RANK_CONSTANT = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    VALUE_CONSTANT = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  def create_cards
    SUIT_CONSTANT.each do |suit|
      for number in 0..12
        a_card = Card.new(suit, VALUE_CONSTANT[number], RANK_CONSTANT[number])
        deck << a_card
      end
    end
  end

  def deal
    deck.shuffle!(random: Random.new(1))
    deck.shift(26).each{|card| @hand1 << card}
    deck.shift(26).each{|card| @hand2 << card}
  end
end

game = Game.new
puts "Welcome to War! (or Peace)This game will be played with 52 cards."
puts "The players today are Megan and Aurora.\n
      Type 'GO' to start the game!"
answer = gets.chomp.to_s.upcase

deck1 = Deck.new(@hand1)
deck2 = Deck.new(@hand2)
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
turn = Turn.new(player1, player2)

if answer == 'GO'
  count = 0
  while count <= 1_000_000
    count += 1
    turn.type
    turn.winner?
    turn.pile_cards
    turn.award_spoils(turn.winner)
    if turn.type == :basic
      puts "Turn #{count}: #{turn.winner} won #{turn.pile_cards.length} cards"
    elsif turn.type == :war
      binding.pry
      puts "WAR - #{turn.winner} won #{turn.pile_cards.length}"
    elsif turn.type == :mutally_assured_destruction
      puts "*mutually assured destruction* 6 cards removed from play"
    end
  end
  game.take_a_turn
  game.end_game
else
  return "Goodbye!"
end
