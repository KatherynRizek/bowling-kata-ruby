require "./lib/bowling_game.rb"
require "test/unit"

class TestBowlingGame < Test::Unit::TestCase

  def test_gutter_ball_game
    g = Game.new()
    g.multiRolls(20)
    assert_equal(0, g.score)
  end

  def test_roll_all_ones
    g = Game.new()
    20.times do
      g.roll(1)
    end
    assert_equal(20, g.score)
  end

  def test_roll_one_spare
    g = Game.new()
    g.roll(7)
    g.roll(3) #adds up to spare
    g.roll(5)
    g.multiRolls(17)
    assert_equal(20, g.score)
  end

  def test_roll_two_spares
    g = Game.new()
    g.roll(7)
    g.roll(3) #adds up to spare
    g.roll(8)
    g.roll(1) 
    g.roll(9)
    g.roll(1)#adds up to two spares
    g.roll(3)
    g.multiRolls(13)
    assert_equal(43, g.score)
  end

  def test_one_strike_beginning
    g = Game.new()
    g.roll(10)
    g.roll(1)
    g.roll(8)
    g.multiRolls(16)
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
    g.multiRolls(12)
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
    g.multiRolls(12)
    assert_equal(31, g.score())
  end

  def test_all_strikes
    g = Game.new()
    12.times do
      g.roll(10)
    end
    assert_equal(300, g.score)
  end

end