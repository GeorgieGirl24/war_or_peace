require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turns = []
  end

  def start
    count = 1
    while count <= 1_000_000
      if @player1.deck.cards.length < 3 && (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.deck.cards.length < 3 && (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      end

      turn = Turn.new(@player1, @player2)
      turn.pile_cards
      turn.award_spoils(turn.winner)

      if turn.type == :basic
        puts "Turn #{count}: #{turn.winner.name} won #{turn.total_cards_won} cards"
      elsif turn.type == :war
        puts "WAR - #{turn.winner.name} won #{turn.total_cards_won} cards"
      elsif turn.type == :mutally_assured_destruction
        puts "*mutually assured destruction* #{turn.total_cards_won} cards removed from play"
      end

      if @player1.has_lost? == true
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif @player2.has_lost? == true
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      end
      count += 1
    end
    "---- DRAW ----"
  end

end
