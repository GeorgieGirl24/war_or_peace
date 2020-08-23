class Turn
  attr_accessor :player1, :player2, :spoils_of_war, :winner, :type, :total_cards_won
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = set_type
    @winner = set_winner
    @total_cards_won = total_cards_won
  end

  def set_type
    return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    return :war if @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
    :mutally_assured_destruction
  end

  def set_winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif type == :mutally_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :mutally_assured_destruction
      player1_count = 0
      player2_count = 0
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
        player1_count += 1
        player2_count += 1
      end
      @total_cards_won = player1_count + player2_count
    elsif type == :war
      player1_count = 0
      player2_count = 0
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        player1_count += 1
        player2_count += 1
        @total_cards_won = player1_count + player2_count
      end
    elsif type == :basic
      player1_count = 1
      player2_count = 1
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @total_cards_won = player1_count + player2_count
    end

  end

  def award_spoils(winner)
    if type != :mutally_assured_destruction
      @spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
  end
end
