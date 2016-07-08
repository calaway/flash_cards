gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_can_create_a_new_guess_with_arguments
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    guess1 = Guess.new("Juneau", card1)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess2 = Guess.new("Saturn", card2)
    assert_instance_of Guess, guess1
    assert_instance_of Guess, guess2
  end

  def test_card_method_returns_card_instance
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    guess1 = Guess.new("Juneau", card1)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess2 = Guess.new("Saturn", card2)
    assert_equal card1, guess1.card
    assert_equal card2, guess2.card
  end

  def test_response_method_returns_user_response
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    guess1 = Guess.new("Juneau", card1)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess2 = Guess.new("Saturn", card2)
    assert_equal "Juneau", guess1.response
    assert_equal "Saturn", guess2.response
  end

  def test_tells_user_if_guess_is_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    guess1 = Guess.new("Juneau", card1)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess2 = Guess.new("Saturn", card2)

    assert_equal true, guess1.correct?
    assert_equal false, guess2.correct?
  end

  def test_gives_user_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    guess1 = Guess.new("Juneau", card1)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess2 = Guess.new("Saturn", card2)
    
    assert_equal "Correct!", guess1.feedback
    assert_equal "Incorrect.", guess2.feedback
  end
end
