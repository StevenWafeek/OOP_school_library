require_relative 'app'

def main
  library_app = LibraryApp.new

  puts 'Welcome to the Library Console App!'

  loop do
    puts "\nPlease choose an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person (teacher or student)'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit the app'

    choice = gets.chomp.to_i

    case choice
    when 1
      library_app.list_all_books
    when 2
      library_app.list_all_people
    when 3
      library_app.create_person
    when 4
      library_app.create_book
    when 5
      library_app.create_rental
    when 6
      library_app.list_rentals_for_person
    when 7
      puts 'Exiting the app. Goodbye!'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

main
