require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'


puts "Welcome to War! (or Peace)\nThis game will be played with 52 cards."
puts "We need two players to play this game."
puts "Who is going to play this game?"
puts "Please enter a name: "
name1 = gets.chomp.to_s.capitalize
puts "We need another player to play this fun game."
puts "Please enter another name now: "
name2 = gets.chomp.to_s.capitalize
puts "The players today are #{name1} and #{name2}.\nType 'GO' to start the game!"
puts "-" * 60
answer = gets.chomp.to_s.upcase

card_generator = CardGenerator.new("cards.txt")
card_generator.cards
full_deck = card_generator.playing_cards
full_deck.shuffle!
deck1 = full_deck.shift(26)
deck2 = full_deck.shift(26)
hand1 = Deck.new(deck1)
hand2 = Deck.new(deck2)
player1 =  Player.new(name1, hand1)
player2 =  Player.new(name2, hand2)


if answer == 'GO'
  game = Game.new(player1, player2)
  game.start
else
  puts "Goodbye!"
end
