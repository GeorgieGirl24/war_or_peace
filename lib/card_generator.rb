require './lib/card'
Dir.chdir(File.dirname(__FILE__))


class CardGenerator
  attr_reader :playing_cards, :card_file
  def initialize(card_file)
    @card_file = File.open(card_file,"r")
    @playing_cards = []
  end

  def create_cards
    @card_file.each do |line|
      a_card = line.chop.split(', ')
      make_a_card = Card.new(a_card[1], a_card[0], a_card[2])
      @playing_cards << make_a_card
    end
  end
end
