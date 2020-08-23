class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    @cards[card_index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    percentage = ((high_ranking_cards.length).to_f / (@cards.length).to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
