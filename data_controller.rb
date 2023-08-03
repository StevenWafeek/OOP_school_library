require './student'
require './teacher'
require './book'
require './rental'
require 'json'

module DataController
  def load_peoble
    file = 'people.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        if element['data_type'] == 'Teacher'
          data.push(Teacher.new(id: element['id'].to_i, age: element['age'].to_i,
                                specialization: element['specialization'], name: element['name']))
        else
          data.push(Student.new(id: element['id'].to_i, age: element['age'].to_i, name: element['name'],
                                parent_permission: element['parent_permission']))
        end
      end
    end
    data
  end

  def load_books
    file = 'books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['title'], element['author']))
      end
    end
    data
  end

  def get_person_by_id(id)
    @persons.each { |element| return element if element.id == id.to_i }
  end

  def get_book_by_title(title)
    @books.each { |element| return element if element.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        person = get_person_by_id(element['person_id'])
        book = get_book_by_title(element['book_title'])
        puts book
        data.push(Rental.new(element['date'], book, person))
      end
    end
    data
  end

  def save_person
    data = []
    @persons.each do |person|
      if person.instance_of?(Teacher)
        data.push({ id: person.id, age: person.age, name: person.name,
                    specialization: person.specialization, data_type: person.class })
      else
        data.push({ id: person.id, age: person.age, name: person.name,
                    parent_permission: person.parent_permission, data_type: person.class })
      end
    end
    File.write('people.json', JSON.generate(data))
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, author: book.author })
    end
    File.write('books.json', JSON.generate(data))
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data.push({ date: rental.date, book_title: rental.book.title, person_id: rental.person.id })
    end
    File.write('rentals.json', JSON.generate(data))
  end
end
