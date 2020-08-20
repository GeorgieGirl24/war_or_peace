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
    play = Play.new(player1, player2)

    assert_instance_of Play, play 
  end

  def test_it_can_start_a_game
  end

  def test_it_can_end_a_game
  end


end
