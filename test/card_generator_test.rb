require 'minitest/autorun'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_can_create_card_generator
    filename = "cards.txt"
    generator_1 = CardGenerator.new(filename)
    assert_instance_of CardGenerator, generator_1
  end

  def test_can_read_file_to_array
    filename = './lib/cards.txt'
    generator_1 = CardGenerator.new(filename)
    line_1 = "What is 5 + 5?,10\n"

    assert_equal Array, generator_1.file_to_array(filename).class
    assert_equal line_1, generator_1.file_to_array(filename)[0]
  end

  def can_parse_lines_to_question_answer_pairs
    filename = './lib/cards.txt'
    generator_1 = CardGenerator.new(filename)
    question_answer_1 = ["What is 5 + 5?", "10"]

    assert_equal question_answer_1, generator_1.parse_lines_to_questions_and_answers
  end
end
