gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def test_can_create_a_new_round_with_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_returns_given_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_returns_player_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_shows_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card

    round.record_guess("Juneau")

    assert_equal card_2, round.current_card
  end

  def test_saves_player_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    response_1 = round.record_guess("Juneau")

    assert_instance_of Guess, response_1

    response_2 = round.record_guess("2")

    assert_instance_of Guess, response_2
  end

  def test_can_count_guesses_this_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 0, round.guesses.count

    round.record_guess("Juneau")

    assert_equal 1, round.guesses.count

    round.record_guess("2")

    assert_equal 2, round.guesses.count
  end

  def test_can_give_player_feedback_on_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    
    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback

    round.record_guess("2")

    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_gives_number_of_correct_guesses_this_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 0, round.number_correct

    round.record_guess("Juneau")

    assert_equal 1, round.number_correct

    round.record_guess("2")

    assert_equal 1, round.number_correct
  end

  def test_gives_percentage_of_correct_guesses_this_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 0, round.percent_correct

    round.record_guess("Juneau")

    assert_equal 100, round.percent_correct

    round.record_guess("2")

    assert_equal 50, round.percent_correct
  end
end
