require './lib/card'

class CardGenerator
  def initialize(filename_given)
    @filename = filename_given
  end

  def file_to_array(file_to_read)
    IO.readlines(file_to_read)
  end

  def parse_lines_to_question_answer_pairs(unparsed_lines)
    unparsed_lines.map do |line|
      line.chomp.split(",")
    end
  end

  def convert_question_answers_to_cards(parsed_lines)
    parsed_lines.map do |line|
      Card.new(line[0], line[1])
    end
  end

  def cards
    unparsed_lines = file_to_array(@filename)
    parsed_lines = parse_lines_to_question_answer_pairs(unparsed_lines)
    convert_question_answers_to_cards(parsed_lines)
  end
end

# filename = './lib/cards.txt'
# generator_1 = CardGenerator.new(filename)
# unparsed_lines = generator_1.file_to_array(filename)
# puts unparsed_lines.inspect
# parsed_lines = parse_lines_to_question_answer_pairs(unparsed_lines)
# puts parsed_lines.inspect
# # convert_question_answers_to_cards(parsed_lines)
