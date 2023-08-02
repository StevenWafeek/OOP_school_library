require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require 'json'

class LibraryApp
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data_from_json
  end

  def list_all_books
    puts "\nList of all books:"
    books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_all_people
    puts "\nList of all people:"
    people.each do |person|
      puts "#{person.name} (#{person.class.name}) - ID: #{person.id}"
    end
  end

  def create_person
    puts "\nCreate a person:"
    puts 'Is it a teacher or a student? (T/S)'
    role = gets.chomp.downcase

    if role == 't'
      puts "Enter the teacher's age:"
      age = gets.chomp.to_i
      if age.zero?
        puts 'Invalid age. Please enter a valid number.'
        return
      end

      puts "Enter the teacher's name:"
      name = gets.chomp
      puts "Enter the teacher's specialization:"
      specialization = gets.chomp
      person = Teacher.new(name, age, specialization)
    elsif role == 's'
      puts "Enter the student's age:"
      age = gets.chomp.to_i
      if age.zero?
        puts 'Invalid age. Please enter a valid number.'
        return
      end

      puts "Enter the student's name:"
      name = gets.chomp
      puts "Enter the student's classroom label:"
      classroom_label = gets.chomp
      classroom = Classroom.new(classroom_label)
      person = Student.new(name, age, classroom)
    else
      puts 'Invalid role. Please try again.'
      return
    end

    people << person

    puts 'Person successfully created!'
    puts "ID: #{person.id}, Name: #{person.name}, Role: #{person.class.name}"
  end

  def create_book
    puts "\nCreate a book:"
    puts "Enter the book's title:"
    title = gets.chomp

    puts "Enter the book's author:"
    author = gets.chomp

    book = Book.new(title, author)

    books << book

    puts 'Book successfully created!'
    puts "Title: #{book.title}, Author: #{book.author}"
  end

  def create_rental
    puts "\nCreate a rental:"

    list_all_people
    list_all_books

    person_id = input_person_id
    return if person_id.nil?

    book_number = input_book_number
    return if book_number.nil?

    book = books[book_number - 1]

    date = nil
    loop do
      date = input_rental_date
      break unless date.nil?

      puts 'Invalid date format. Please enter the date in the format "YYYY-MM-DD".'
    end

    person = people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rental = Rental.new(date, book, person)
    @rentals << rental

    puts "Rental created successfully"

    # Save rentals data to JSON after creating a new rental
    save_rentals_to_json(@rentals) # Pass @rentals as an argument
  end

  def input_person_id
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return nil
    end

    person_id
  end

  def input_book_number
    puts 'Enter the number of the book you want to rent:'
    book_number = gets.chomp.to_i

    if book_number < 1 || book_number > books.length
      puts 'Invalid book number. Please try again.'
      return nil
    end

    book_number
  end

  def input_rental_date
    puts 'Enter the rental date (YYYY-MM-DD):'
    date = gets.chomp
    date.match(/\A\d{4}-\d{2}-\d{2}\z/) ? date : nil
  end

  def list_rentals_for_person
    puts "\nList rentals for a person:"
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
    end
  end
 # Standalone method to save all data to JSON files
 def save_data_to_json
  save_books_to_json(books)
  save_people_to_json(people)
  save_rentals_to_json(@rentals)
end

# Standalone method to load all data from JSON files
def load_data_from_json
  @books = load_books_from_json
  @people = load_people_from_json
  @rentals = load_rentals_from_json(@books, @people) # Pass @books and @people as arguments
end

# Helper method to save books to JSON
def save_books_to_json(books)
  File.open('books.json', 'w') do |file|
    file.write(JSON.pretty_generate(books.map(&:to_hash)))
  end
end

# Helper method to load books from JSON
def load_books_from_json
  return [] unless File.exist?('books.json')

  data = JSON.parse(File.read('books.json'))
  data.map { |book_data| Book.from_hash(book_data) }
end

# Helper method to save people to JSON
def save_people_to_json(people)
  File.open('people.json', 'w') do |file|
    file.write(JSON.pretty_generate(people.map(&:to_hash)))
  end
end

# Helper method to load people from JSON
def load_people_from_json
  return [] unless File.exist?('people.json')

  data = JSON.parse(File.read('people.json'))
  data.map { |person_data| Person.from_hash(person_data) }
end

# Helper method to load rentals from JSON
def load_rentals_from_json(books, people)
  return [] unless File.exist?('rentals.json')

  data = JSON.parse(File.read('rentals.json'))
  rentals = data.map do |rental_data|
    book = books.find { |b| b.title == rental_data['book']['title'] && b.author == rental_data['book']['author'] }
    person = people.find { |p| p.id == rental_data['person_id'] }

    if book.nil?
      puts "Book with title '#{rental_data['book']['title']}' and author '#{rental_data['book']['author']}' not found."
      next
    end

    if person.nil?
      puts "Person with ID #{rental_data['person_id']} not found."
      next
    end

    Rental.new(rental_data['date'], book, person)
  end

  rentals.compact # Remove any nil elements from the array
end

# Helper method to save rentals to JSON
def save_rentals_to_json(rentals)
  rentals_data = rentals.map do |rental|
    {
      'date' => rental.date,
      'book' => {
        'title' => rental.book.title,
        'author' => rental.book.author
      },
      'person_id' => rental.person.id,
      'classroom_label' => rental.person.is_a?(Student) ? rental.person.classroom&.label : nil
    }
  end

  File.open('rentals.json', 'w') do |file|
    file.write(JSON.pretty_generate(rentals_data))
  end
end



# Add a method to register rental for a book and person
def register_rental(rental)
  rental.book.rentals << rental
  rental.person.rentals << rental
end
end