require "./lib/bowling_game.rb"
require "test/unit"

class TestBowlingGame < Test::Unit::TestCase

  def test_gutter_ball_game
    g = Game.new()
    g.manyRolls(20)
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
    g.manyRolls(17)
    assert_equal(20, g.score)
  end

  def test_roll_two_spares
    g = Game.new()
    g.roll(7)
    g.roll(3) #adds up to spare
    g.roll(8)
    g.roll(2) #adds up to two spares
    g.roll(3)
    g.manyRolls(15)
    assert_equal(34, g.score)
  end

  def test_one_strike_beginning
    g = Game.new()
    g.roll(10)
    g.roll(1)
    g.roll(8)
    g.manyRolls(16)
    assert_equal(28, g.score)
  end

  def test_two_strikes
    g = Game.new()
    g.roll(10)
    g.roll(1)
    g.roll(7)
    g.roll(10)
    g.roll(2)
    g.roll(3)
    g.manyRolls(12)
    assert_equal(46, g.score())
  end

  def test_one_strike_later
    g = Game.new()
    g.roll(1)
    g.roll(2)
    g.roll(1)
    g.roll(7)
    g.roll(10)
    g.roll(2)
    g.roll(3)
    g.manyRolls(12)
    assert_equal(31, g.score())
  end

  # def test_all_strikes
  #   g = Game.new()
  #   i = 2
  #   until 


end