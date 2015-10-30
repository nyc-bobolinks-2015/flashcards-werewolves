class Deck

  def start
    cards.each_with_index do |card,card_index|
      puts "Question #{card_index}"
      puts "#{card.definition}"
      user_answer_right?(user_answer = gets.chomp, card_index)
    end
  end

  def user_answer_right?(user_answer, card_index)
    user_answer == cards[card_index].answer
  end

  def answer_feedback(user_answer_right)

  end
end
