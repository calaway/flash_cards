gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_can_create_a_new_card
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_instance_of Card, card
  end

  def test_can_get_card_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    alaska = "What is the capital of Alaska?"

    assert_equal alaska, card.question
  end

  def test_can_get_card_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "Juneau", card.answer
  end

  def test_can_get_specific_card_question
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    state = "What is the capital of Alaska?"
    planet = "Which planet is closest to the sun?"

    assert_equal state, card1.question
    assert_equal planet, card2.question
  end

  def test_can_get_specific_card_answer
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")
    
    assert_equal "Juneau", card1.answer
    assert_equal "Mercury", card2.answer
  end
end
