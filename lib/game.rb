require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Game
  attr_reader :player1, :player2, :turn, :turns

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = Turn.new(@player1, @player2)
    @turns = []
  end

  def start
    count = 1
    while count <= 1_000_000 #|| player1.has_lost? == true || player2.has_lost? == false
      a_turn_type = turn.type
      turn.winner?
      turn.pile_cards
      turn.award_spoils(turn.winner)
      if a_turn_type == :basic
        puts "Turn #{count}: #{turn.winner.name} won #{turn.total_cards_removed_from_pile_cards} cards"
        puts "#{@player1.name} has #{@player1.deck.cards.length}"
        puts "#{@player2.name} has #{@player2.deck.cards.length}"
      elsif a_turn_type == :war
        puts "WAR - #{turn.winner.name} won #{turn.total_cards_removed_from_pile_cards} cards"
        puts "#{@player1.name} has #{@player1.deck.cards.length}"
        puts "#{@player2.name} has #{@player2.deck.cards.length}"
      elsif a_turn_type == :mutally_assured_destruction
        puts "*mutually assured destruction* #{turn.total_cards_removed_from_pile_cards} cards removed from play"
        puts "#{@player1.name} has #{@player1.deck.cards.length}"
        puts "#{@player2.name} has #{@player2.deck.cards.length}"
      end
      turn.spoils_of_war.clear
      @turns << a_turn_type
      # binding.pry
      count += 1
      if @player1.has_lost? == true || @player2.has_lost? == true || a_turn_type == :loss
        if @player1.has_lost? == false
          "*~*~*~* #{@player1} has won the game! *~*~*~*"
          break
        elsif @player2.has_lost? == false
          "*~*~*~* #{@player2} has won the game! *~*~*~*"
          break
        end

      end
      "---- DRAW ----"
    end

  end

end
