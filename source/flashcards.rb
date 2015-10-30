
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

# class Controller
#   def initialize(file)
#     @deck = Deck.new(file)
#   end
# end

# class View
# end

class Card
  attr_accessor :definition, :answer, :answered_correct
  def initialize(args)
    @definition = args[:definition]
    @answer = args[:answer]
    @answered_correct = false
  end

  def user_answer_right?(user_answer)
    # returns true or false
  end

end

class Deck
  attr_accessor :cards, :file

  def initialize(file)
    @cards = []
    @file = file
  end

  def parse_cards
    new_cards = CSV.foreach(file, :headers => false)
    cards << row
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

deck = Deck.new('flashcard_samples.txt')
# make new Deck Object
# deck.parse_cards
# instatiate cards objects
deck.cards << Card.new(definition: "What color is the sky?", answer: "blue")
deck.cards << Card.new(definition: "What color is grass?", answer: "green")
deck.cards << Card.new(definition: "What color is a yellow crayon?", answer: "yellow")
# deck.start
p deck.cards
puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
deck.start
