require './app'
require './input'
require './data_controller'

class Main
  def initialize
    @app = App.new
    @input = Input.new
  end

  def run
    user_input = 0
    puts 'Welcome to School Library App!'
    while user_input != '7'
      options
      user_input = @input.read
      @app.options_cases(user_input)
    end
    puts 'Thank you for using this app!'

    @app.save_person
    @app.save_books
    @app.save_rental
  end

  def options
    puts
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end

main = Main.new
main.run
