require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

puts "Welcome to War! (or Peace)This game will be played with 52 cards."
puts "The players today are Megan and Aurora.\nType 'GO' to start the game!"
puts "-" * 60
answer = gets.chomp.to_s.upcase

full_deck = []
hand1 = []
hand2 = []

SUIT =  [:heart, :diamond, :club, :spade]
RANK =  ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

SUIT.each do |suit|
  for number in 0..12
    a_card = Card.new(suit, VALUE[number], RANK[number])
    full_deck << a_card
  end
end

full_deck.shuffle!(random: Random.new(1))
hand1 = full_deck.shift(26)
hand1 = full_deck.shift(26)
deck1 = Deck.new(hand1)
deck2 = Deck.new(hand2)

player1 =  Player.new('Megan', deck1)
player2 =  Player.new('Aurora', deck2)

if answer == 'GO'
  game = Game.new(player1, player2)
  game.start
  game.end
else
  puts "Goodbye!"
end
