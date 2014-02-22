class GridCardResponder
  def initialize(grid_card_values)
    @grid_card_values = grid_card_values
  end

  def respond_to(challenge_string)
    begin
      challenges = Challenges.new(challenge_string)

      raise unless challenges.valid?

      grid_card = GridCard.new(@grid_card_values)

      response1 = grid_card.value(challenges.one)
      response2 = grid_card.value(challenges.two)
      response3 = grid_card.value(challenges.three)

      raise unless _valid_responses?([response1, response2, response3])

      "#{response1} #{response2} #{response3}"

    rescue
      'Error: Did you enter 3 coordinates?'
    end
  end

  private

  def _valid_responses?(responses)
    responses.all? { |r| [1,2].include?(r.strip.size) }
  end

  class Challenges
    attr_reader :one, :two, :three

    def initialize(challenges)
      @challenge_list = challenges.split(' ')
      @one, @two, @three = @challenge_list
    end

    def valid?
      @challenge_list.count == 3 && @challenge_list.all? { |challenge| challenge.size == 2 }
    end
  end

  class GridCard
    def initialize(grid_card)
      @grid_card = grid_card
    end

    def value(coordinate)
      @grid_card[_row(coordinate)][_column(coordinate)].upcase
    end

    private

    def _row(coordinate)
      coordinate[1].to_i - 1
    end

    def _column(coordinate)
      coordinate.ord - 'a'.ord
    end
  end
end