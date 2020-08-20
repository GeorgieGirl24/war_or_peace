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
    # skip
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

    war_or_peace.start_game
    #how to write a test to test what it doesn't do
    assert_equal "#{player1} vs. #{player2}", play.start
  end

  def test_it_knows_to_utilize_the_play_class
    # skip
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

    war_or_peace.start_game
    play.start

    assert_equal "#{player1} vs. #{player2}", play.start
  end

  def test_it_can_take_a_turn
    skip
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

    war_or_peace.start_game
    play.start
    play.take_a_turn

    assert_equal winner, play.take_a_turn.winner
  end

  def test_it_can_end_a_game
  end


end
