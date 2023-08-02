class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    register_rental
  end

  def self.from_hash(hash, books, people)
    book_title = hash['book']['title']
    book_author = hash['book']['author']
    book = books.find { |b| b.title == book_title && b.author == book_author }

    person_id = hash['person_id']
    person = people.find { |p| p.id == person_id }

    self.new(hash['date'], book, person)
  end

  def to_hash
    {
      'date' => @date,
      'book' => @book.to_hash,
      'person_id' => @person.id,
      'classroom_label' => @person.classroom&.label
    }
  end

  private

  def register_rental
    @book.add_rental(self) if @book
    @person.add_rental(self) if @person
  end
end
