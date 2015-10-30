require 'csv'

# # # # C method: play
#     deck = Deck.new('flashcard_samples.txt')
#     # make new Deck Object
#     deck.parse_cards
#     # instatiate cards objects
#     deck.start
# # # #

# # # # C method: guess, correct_guess, wrong_guess, choose_card

# # displays first card.definition
# # prompt for guess
# # get user input
# # send user input to a method in card?
#   card.user_answer_right?(user_answer)
#   # output = t / f
#   # send message to view to determine puts display
#   # if f, repeat prompt for guess, etc
# # if t, print "Correct!"
# # increase card index by 1, display new card in deck.cards
#   # displays card.definition
#   # prompt for guess
#   # get user input
#   # send user input to a method in card?
#     card.user_answer_right?(user_answer)

class Controller
  attr_reader :deck, :view

  def initialize(file)
    @deck = Deck.new(file)
    @view = View.new
  end

  def start
    view.display("Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!")
    deck.cards.each do |card|
      view.display("Definition:")
      view.display("#{card.definition}")
      user_answer_right(card)
    end
  end

  def user_answer_right(card)
    if view.gets_input == card.answer
      view.display("Correct!")
    else
      view.display("That's not quite right...Try again.\n #{card.definition}")
      user_answer_right(card)
    end
  end
end

class View

  def initialize
  end

  def gets_input
    gets.chomp
  end

  def display(value)
    puts value
  end

end

class Card
  attr_accessor :definition, :answer, :answered_correct

  def initialize(args)
    @definition = args[:definition]
    @answer = args[:answer]
    @answered_correct = false
  end
end

class Deck
  attr_accessor :cards

  def initialize(file)
    @cards = []
    parse_cards(file)
  end

  def parse_cards(file)
    counter = 0
    card_num = 0
    CSV.foreach(file, :quote_char => '|') do |row|
      if counter == 2
        counter = 0
      elsif counter == 0
        cards << Card.new(:definition => row)
        counter+=1
      elsif counter == 1
        cards[card_num].answer = row.to_s
        card_num += 1
        counter += 1
      end
    end
  end

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

control = Controller.new('flashcard_samples.txt')
control.start

# make new Deck Object
# deck.parse_cards
# instatiate cards objects
# deck.cards << Card.new(definition: "What color is the sky?", answer: "blue")
# deck.cards << Card.new(definition: "What color is grass?", answer: "green")
# deck.cards << Card.new(definition: "What color is a yellow crayon?", answer: "yellow")
# # deck.start
# p deck.cards
# puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
# deck.start(1)
