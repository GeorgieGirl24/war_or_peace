require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'

class WarOrPeaceTest < Minitest::Test
  def test_it_exists
    war_or_peace = WarOrPeace.new

    assert_instance_of WarOrPeace, war_or_peace
  end

  def test_it_can_create_fifty_two_cards
    # skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards

    assert_equal 52, war_or_peace.deck.length
  end

  def test_there_are_four_suits_in_the_deck
    skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    ()

    assert_equal 4, war_or_peace.variable.length
  end

  def test_deck_has_four_different_sets_of_ranks
    skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards

    (2..14).each do |rank|
      cards_in_rank = war_or_peace.deck.count do |card|
        p card.rank == rank
      end
      assert_equal 4, war_or_peace.cards_in_rank
    end
  end

  def test_it_can_split_the_deck_into_two_hands
    # skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    war_or_peace.make_two_hands

    assert 26, war_or_peace.hand1.length
    assert 26, war_or_peace.hand2.length
  end

  def test_two_players_have_their_own_unique_hands
    skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    war_or_peace.make_two_hands
    war_or_peace.
    deck1 = Deck.new(war_or_peace.hand1)
    deck2 = Deck.new(war_or_peace.hand2)
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)


  end

end
