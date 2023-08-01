require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class LibraryApp
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
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
      puts "Enter the teacher's name:"
      name = gets.chomp
      puts "Enter the teacher's specialization:"
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name: name)
    elsif role == 's'
      puts "Enter the student's age:"
      age = gets.chomp.to_i
      puts "Enter the student's name:"
      name = gets.chomp
      puts "Enter the student's classroom label:"
      classroom_label = gets.chomp
      classroom = Classroom.new(classroom_label)
      person = Student.new(age, classroom, name: name)
    else
      puts 'Invalid role. Please try again.'
      return
    end

    people << person # Store the newly created person instance in the 'people' array

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
    puts "\nList of all books:"
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end

    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    puts 'Enter the number of the book you want to rent:'
    book_number = gets.chomp.to_i

    if book_number < 1 || book_number > books.length
      puts 'Invalid book number. Please try again.'
      return
    end

    book = books[book_number - 1]

    puts 'Enter the rental date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, book, person)
    book.rentals << rental
    person.rentals << rental

    puts 'Rental successfully created!'
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
end
