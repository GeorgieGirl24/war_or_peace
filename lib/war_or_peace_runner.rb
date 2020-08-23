require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


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

if answer == 'GO'
  game = Game.new(name1, name2)
  game.deal
  game.start
else
  puts "Goodbye!"
end
