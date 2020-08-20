require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'
require './lib/play'

class PlayTest < Minitest::Test
  def test_it_exists
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    war_or_peace.make_two_hands
    deck1 = Deck.new(war_or_peace.hand1)
    deck2 = Deck.new(war_or_peace.hand2)
    assert_instance_of Deck, deck1
    assert_instance_of Deck, deck2
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    assert_equal 'Megan', player1.name
    assert_equal 'Aurora', player2.name
    play = Play.new(player1, player2)

    assert_instance_of Play, play
  end

  def test_it_can_start_a_game
  end

  def test_it_can_end_a_game
  end


end
