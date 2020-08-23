require './lib/card'
Dir.chdir(File.dirname(__FILE__))


class CardGenerator
  attr_reader :playing_cards
  def initialize
    @playing_cards = []
  end

  def create_cards
    File.open("cards.txt","r").each do |line|
      a_card = line.chop.split(', ')
      make_a_card = Card.new(a_card[1], a_card[0], a_card[2])
      @playing_cards << make_a_card
    end
  end
end
