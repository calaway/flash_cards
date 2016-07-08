class Round
attr_reader :deck, :guesses, :number_correct

  def  initialize(deck_given)
    @deck = deck_given
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@guesses.length]
  end

  def record_guess(player_response)
    @guesses << Guess.new(player_response, @deck.cards[@guesses.length])
    if @guesses.last.correct?
      @number_correct += 1
    end
    @guesses.last
  end

  def percent_correct
    if @guesses.empty?
      0
    else
      ((@number_correct.to_f / @guesses.length) * 100).to_i
    end
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards.
    -------------------------------------------------"
    deck.cards.each do |card|
      puts "This is card number #{@guesses.length + 1} out of #{deck.count}"
      puts "Question: #{card.question}"
      player_response = gets.chomp
      record_guess(player_response)
      puts @guesses.last.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
  end
end
