require 'minitest/autorun'
require_relative 'grid_card_responder'

class GridCardResponderTest < MiniTest::Unit::TestCase
  def setup
    grid_card_values = [
      ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'],
      ['k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't'],
      ['u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4'],
      ['5', '6', '7', '8', '9', '10', '11', '12','13','14'],
      ['15', '16', '17', '18', '19', '20', '21', '22', '23', '24']
    ]
    @grid_card_values = GridCardResponder.new(grid_card_values)
  end

  def test_gives_error_when_not_enough_inputs
    assert_equal 'Error: Did you enter 3 coordinates?', @grid_card_values.respond_to('a1')
  end

  def test_gives_error_when_no_inputs
    assert_equal 'Error: Did you enter 3 coordinates?', @grid_card_values.respond_to('')
  end

  def test_gives_error_when_too_many_inputs
    assert_equal 'Error: Did you enter 3 coordinates?', @grid_card_values.respond_to('a1 a2 a3 a4')
  end

  def test_gives_error_when_badly_formed_inputs
    assert_equal 'Error: Did you enter 3 coordinates?', @grid_card_values.respond_to('1 2 3')
  end

  def test_gives_error_when_something_goes_wrong
    assert_equal 'Error: Did you enter 3 coordinates?', @grid_card_values.respond_to('x1 y1 z1')
  end

  def test_handles_extra_spaces
    assert_equal 'A K U', @grid_card_values.respond_to('  a1   a2  a3')
  end

  def test_same_row
    assert_equal 'A K U', @grid_card_values.respond_to('a1 a2 a3')
  end

  def test_same_column
    assert_equal 'A B C', @grid_card_values.respond_to('a1 b1 c1')
  end

  def test_diagonal
    assert_equal 'A L W', @grid_card_values.respond_to('a1 b2 c3')
  end

  def test_last_column
    assert_equal 'J T 4', @grid_card_values.respond_to('j1 j2 j3')
  end

  def test_responses_with_two_characters
    assert_equal '18 18 18', @grid_card_values.respond_to('d5 d5 d5')
  end
end