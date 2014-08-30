require 'minitest/autorun'
require_relative 'grid_card_responder'

class GridCardResponderTest < MiniTest::Test
  def setup
    @grid_card_values = GridCardResponder.new('./grid_card')
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
    assert_equal 'A 1 A', @grid_card_values.respond_to('  a1   a2  a3')
  end

  def test_same_row
    assert_equal 'A 1 A', @grid_card_values.respond_to('a1 a2 a3')
  end

  def test_same_column
    assert_equal 'A B C', @grid_card_values.respond_to('a1 b1 c1')
  end

  def test_diagonal
    assert_equal 'A 2 C', @grid_card_values.respond_to('a1 b2 c3')
  end

  def test_last_column
    assert_equal 'J 0 J', @grid_card_values.respond_to('j1 j2 j3')
  end

  def test_responses_with_two_characters
    assert_equal 'D D D', @grid_card_values.respond_to('d5 d5 d5')
  end

  def test_integration_into_alfred
    response = GridCardResponder.new('./grid_card').respond_to('a1 b1 c1')

    assert_equal 'A B C', response
  end
end