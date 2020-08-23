require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :player1, :player2, :turns, :full_deck,
              :hand1, :hand2, :name1, :name2,
              :card_file, :card_generator
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @card_file = File.open("cards.txt")
    @card_generator = CardGenerator.new(card_file)
    @player1 = player1
    @player2 = player2
    @turns = []
    @full_deck = []
    @hand1 = []
    @hand2 = []
  end

  def deal
    card_generator.cards
    @full_deck = card_generator.playing_cards
    @full_deck.shuffle!
    @hand1 = full_deck.shift(26)
    @hand2 = full_deck.shift(26)
    @deck1 = Deck.new(hand1)
    @deck2 = Deck.new(hand2)
    @player1 =  Player.new(name1, @deck1)
    @player2 =  Player.new(name2, @deck2)
  end

  def start
    count = 1
    while count <= 1_000_000

      if @player1.deck.cards.length < 3 &&
        (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))
        @player1.deck.cards.collect do |card|
          @player2.deck.add_card(card)
        end
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.deck.cards.length < 3 &&
        (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))
        @player1.deck.cards << @player2.deck.cards
        @player2.deck.cards.clear
        @player1.deck.cards.flatten!
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
        @turns << turn
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif @player2.has_lost? == true
        @turns << turn
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      end
      count += 1
      @turns << turn
    end
    puts "---- DRAW ----" if count > 1_000_000
  end

end
