require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Jack', 11)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:spade, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:diamond, '10', 10)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_it_can_create_a_turn_instance
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)

    game.start

    assert_instance_of Turn, turn
  end

  def test_it_can_assign_a_winner_after_three_turns
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:heart, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '4', 4)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:spade, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, '9', 9)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)

    game.start

    assert_equal 2, game.player1.deck.cards.length
    assert_equal 0, game.player2.deck.cards.length
    assert_equal false, game.player1.has_lost?
    assert_equal true, game.player2.has_lost?
  end

  def test_it_can_find_a_winner_after_a_war_turn_with_someone_running_out_of_cards
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Jack', 11)
    cards1 << card3
    card4 = Card.new(:diamond, 'Queen', 12)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:heart, '2', 2)
    cards2 << card2
    card3 = Card.new(:club, 'Jack', 11)
    cards2 << card3
    card4 = Card.new(:diamond, '10', 10)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)

    game.start

    turn_1 = game.turns[0]
    turn_2 = game.turns[1]

    assert_equal 2, game.turns.count
    assert_equal 6, game.player1.deck.cards.length
    assert_equal 0, game.player2.deck.cards.length

    assert_equal false, game.player1.has_lost?
    assert_equal true, game.player2.has_lost?
  end

  def test_it_can_find_another_winner_of_the_game
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, 'Queen', 12)
    cards1 << card2
    card3 = Card.new(:heart, 'Jack', 11)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:spade, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, '5', 5)
    cards2 << card3
    card4 = Card.new(:diamond, '7', 7)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)

    game.start

    turn_1 = game.turns[0]
    turn_2 = game.turns[1]
    turn_3 = game.turns[2]
    turn_4 = game.turns[3]

    assert_equal 4, game.turns.count

    assert_equal 8, game.player1.deck.cards.length
    assert_equal 0, game.player2.deck.cards.length

    assert_equal false, game.player1.has_lost?
    assert_equal true, game.player2.has_lost?
  end

  def test_run_out_of_cards_war
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '4', 4)
    cards1 << card3
    deck1 = Deck.new(cards1)
    player1 = Player.new("Levi", deck1)
    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:heart, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Melanie", deck2)
    game = Game.new(player1, player2)

    game.start

    turn_1 = game.turns[0]
    turn_2 = game.turns[1]

    assert_equal player2.name, turn_1.winner.name
    assert_equal 1, game.turns.count
  end

  def test_it_can_figure_out_a_draw_type_of_game
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Jack', 11)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:spade, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:diamond, '10', 10)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(player1, player2)

    game.start

  assert_equal 1_000_000, game.turns.count
  assert_equal nil, game.start
  end

end
