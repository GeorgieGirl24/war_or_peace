require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    card_generator = CardGenerator.new

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_can_read_a_txt_file
    card_generator = CardGenerator.new
    card_generator.create_cards

    assert_equal 52, card_generator.playing_cards.length
  end

  def test_there_are_four_suits
    card_generator = CardGenerator.new
    card_generator.create_cards
    result = card_generator.playing_cards.group_by do |card|
      card.suit
    end

    assert_equal 4, result.keys.length
  end

  def test_there_are_thirteen_cards_per_suit
    card_generator = CardGenerator.new
    card_generator.create_cards
    result = card_generator.playing_cards.group_by do |card|
      card.rank
    end

    assert_equal 13, result.keys.length
  end

end
