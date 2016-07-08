require './lib/card'

class Guess
  attr_reader :response, :card

  def initialize(player_response, player_card)
    @response = player_response
    @card = player_card
  end

  def correct?
    @response == @card.answer
  end

  def feedback
    if @response == @card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
