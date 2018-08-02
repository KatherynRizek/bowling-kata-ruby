require "./lib/bowling_game.rb"
require "test/unit"

class TestBowlingGame < Test::Unit::TestCase

  def test_gutter_ball_game
    g = Game.new()
    i = 0
    until i >= 20 do
      g.roll(0)
      i += 1
    end
    assert_equal(0, g.score)
  end

  def test_roll_all_ones
    g = Game.new()
    i = 0
    until i >= 20 do
      g.roll(1)
      i += 1
    end
    assert_equal(20, g.score)
  end

  def test_roll_one_spare
    g = Game.new()
    g.roll(7)
    g.roll(3) #adds up to spare
    g.roll(5)
    i = 0
    until i >= 17 do
      g.roll(0)
      i += 1
    end
    assert_equal(20, g.score)
  end

end